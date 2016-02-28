{-# LANGUAGE GADTs #-}
module TypeCheck where

import AbsTTR
import PrintTTR
import ErrM

data TCEnv = TCEnv {
  defs    :: Functions,      -- function definitions
  headers :: Signature,      -- function type signatures
  context :: Context,        -- local type context
  subst   :: Context,        -- local value context
  gen     :: Int             -- value for VGen
  }

initTCEnv = TCEnv [] [] [] [] 0

type Functions = [(Id,Val)]
type Signature = [(Id,Type)]
type Context   = [(Id,Type)]

type Type = Val

data Val = VGen Int | VApp Val Val | VClos Exp Context
  deriving (Eq,Show)

tInd  = vId (Id "Ind")
tType = vId (Id "Type")
tInt = vId (Id "Int")
tString = vId (Id "String")
tFloat = vId (Id "Float")
tRecType = VClos ERecTyp []

baseTypings = [
  (Id "Ind",   tType),
  (Id "Type",  tType),
  (Id "Int",   tType),
  (Id "Float", tType),
  (Id "String",tType)
  ]

isRecType :: Exp -> Bool
isRecType e = case e of
  ERecord []      -> True
  ERecord fs@(_:_) -> null [() | FEq _ _ <- fs] -- both x : A and x = a : A
  _ -> False

isRecord :: Exp -> Bool
isRecord e = case e of
  ERecord []      -> True -- make sure not to confuse record {} with type {}
  ERecord fs@(_:_) -> length [() | FEq _ _ <- fs] == length fs --- only x = a --- thus no typed fields
  _ -> False

baseConstants = [(t, vId t) | (t,_) <- baseTypings]

vClos e = VClos e []
vId c = vClos (EId c)

dummyId = Id "_"

printVal v = case v of
  VApp u v -> printVal u ++ "(" ++ printVal v ++ ")"
  VClos e [] -> printTree e
  _ -> show v

---- full evaluation defined separately in Evaluate
--evalExp :: TCEnv -> Exp -> Err Val
--evalExp env exp = whnf env (VClos exp []) ----

whnf :: TCEnv -> Val -> Err Val
whnf env v = case v of
  VApp u v -> do
    wu <- whnf env u
    wv <- whnf env v 
    app wu wv
  VClos e g -> eval g e
  _ -> return v
  
 where
 
  -- forms an application, except for a beta redex  
  app :: Val -> Val -> Err Val
  app u v = case u of
    VClos (EAbs x _ body) g -> eval ((x,v) : g) body
    _ -> return $ VApp u v

  eval :: Context -> Exp -> Err Val
  eval g exp = case exp of
    EId x -> case lookup x (g ++ defs env ++ baseConstants) of
      Just v -> return v
      _ -> fail ("type checking eval error: cannot find " ++ printTree x)
    EApp f e -> do
      vf  <- eval g f
      ve  <- eval g e 
      app vf ve
    ELet x d _ e -> do  ---- not in TC's paper, which calls eval in checkExp
      vd <- eval g d
      eval ((x,vd):g) e
    EProj r l -> do
      vr  <- eval g r
      wvr <- whnf env{subst = g ++ subst env} vr ---- why eval doesn't suffice ??
      case wvr of
        VClos (ERecord fs) gr -> case lookup l [(k,d) | FEq k d <- fs] of
          Just d -> eval gr d
          _ -> fail $ "type check eval: cannot find label " ++ printTree l ++ " in " ++ printVal wvr
        _ -> fail $ "type check eval: record expected to project " ++ printTree l ++ " but found " ++ printVal wvr

    _ -> return $ VClos exp g

{-
-- in TC paper
eqVal :: TCEnv -> Val -> Val -> Err ()
eqVal env u v = do
  let i = gen env
  wu <- whnf env u
  wv <- whnf env v
  case (wu,wv) of
    (VApp f u, VApp h v) -> do
      eqVal env f h
      eqVal env u v
    (VClos (EAbs x1 _ b1) g1, VClos (EAbs x2 _ b2) g2) -> do
      let v = VGen i
      eqVal (env{gen = i+1})
         (VClos b1 ((x1,v):g1))
         (VClos b2 ((x2,v):g2))
    (VClos (EProd x1 a1 b1) g1, VClos (EProd x2 a2 b2) g2) -> do
      eqVal env (VClos a1 g1) (VClos a2 g2)
      let v = VGen i
      eqVal (env{gen = i+1})
         (VClos b1 ((x1,v):g1))
         (VClos b2 ((x2,v):g2))
    ---- TODO dependent record types ??
    _ ->
      if wu == wv
        then return ()
        else fail ("type mismatch: inferred " ++ printVal wu ++ " <> expected " ++ printVal wv)
-}

-- adapted to subtyping; not in TC paper
subVal :: TCEnv -> Val -> Val -> Err ()
subVal env u v = do
  let i = gen env
  wu <- whnf env u
  wv <- whnf env v
  case (wu,wv) of
    (VApp f u, VApp h v) -> do
      subVal env f h
      subVal env u v
    (VClos (EAbs x1 _ b1) g1 , VClos (EAbs x2 _ b2) g2) -> do
      let v = VGen i
      subVal (env{gen = i+1})
         (VClos b1 ((x1,v):g1))
         (VClos b2 ((x2,v):g2))
    (VClos (EProd x1 a1 b1) g1 , VClos (EProd x2 a2 b2) g2) -> do
      subVal env (VClos a2 g2) (VClos a1 g1) -- contravariance 
      let v = VGen i
      subVal (env{gen = i+1})
         (VClos b1 ((x1,v):g1))
         (VClos b2 ((x2,v):g2))

    (VClos e1@(ERecord fs1) g1 , VClos e2@(ERecord fs2) g2) | isRecType e1 && isRecType e2 ->
      if all (flip elem fs1) fs2 && g1 == g2   ---- TODO allow subtyping of components 
        then return ()
        else mismatch wu wv

---- a superficial interpretation of set-theoretic operations

    (_, VClos (EUnion a b) g) -> do           -- c < a||b  if c < a or c < b 
      let ea = subVal env u (VClos a g)
      case ea of
        Ok _ -> return ()
        _  -> subVal env u (VClos b g)
        
    (VClos (EInters a b) g, _) -> do         -- a&&b < c if a < c && b < c
      let ea = subVal env (VClos a g) v
      case ea of
        Ok _ -> return ()
        _  -> subVal env (VClos b g) v
    
    _ | wu == tRecType && wv == tType -> return ()
    
    _ ->
      if wu == wv
        then return ()
        else mismatch wu wv
 where
   mismatch u v = fail ("inferred " ++ printVal u ++ " <> expected " ++ printVal v)

checkType :: TCEnv -> Exp -> Err ()
checkType env e
  | isRecType e = checkExp env e tRecType
  | otherwise   = checkExp env e tType

checkExp :: TCEnv -> Exp -> Type -> Err ()
checkExp env exp typ = case exp of
  EAbs x _ e -> do  ---- TODO: check type of lambda
    let i = gen env
    vtyp <- whnf env typ
    case vtyp of
      VClos (EProd y a b) g -> do
        let env' = env{
            gen = i+1,
            subst   = (x,VGen i)    : subst(env),
            context = (x,VClos a g) : context(env)
            }
        checkExp env' e (VClos b ((y,VGen i):g))
      _ -> fail $ "checking " ++ printTree exp ++ " : expected function type, found " ++ printVal vtyp
{- -- in TC paper; but we do inferExp 
  EProd x a b -> do
    checkType env a
    let i = gen env
    vtyp <- whnf env typ
    if not (elem vtyp [tType,tRecType])
      then fail ("expected Type or RecType for: " ++ printTree exp)
      else do
        let env' = env{
            gen = i+1,
            subst   = (x,VGen (i+1))           : subst(env),
            context = (x,VClos a (subst(env))) : context(env)
            }
        checkType env' b
-}
  ELet x d t e -> do
    checkType env t
    let vt = VClos t (subst env) ---- in paper: <- eval env t ---- why not whnf
    checkExp env d vt
    let vd = VClos d (subst env) ---- in paper: <- eval env d
    let env' = env{
            subst   = (x,vd)        : subst(env),
            context = (x,vt) : context(env)
            }
    checkExp env' e typ

-- not in TC
  ERecord fs | isRecord exp -> do
    vtyp <- whnf env typ
    case vtyp of
      VClos e@(ERecord ftys) g | isRecType e -> do
        let fetys = [(x,d,t) | FIn x t <- ftys, Just d <- [lookup x [(y,d) | FEq y d <- fs]]]  -- sorting by record type order, ignoring irrelevant fields
        if length fetys < length ftys                                                          -- TODO: manifest fields
          then fail ("missing fields in " ++ printTree exp ++ " : " ++ printVal vtyp)
          else checkRecordFields env fetys 
        
  _ -> do
    typ0 <- inferExp env exp
    let esub = subVal env typ0 typ
    case esub of
      Ok v -> return v
      Bad s -> fail $ "type mismatch in " ++ printTree exp ++ ":\n" ++ s
      
--    eqVal env typ0 typ -- in TC paper: no subtyping

inferExp :: TCEnv -> Exp -> Err Type
inferExp env exp = case exp of
  EId x -> case lookup x (context env ++ headers env ++ baseTypings) of
    Just ty -> return ty
    _ -> fail $ "cannot find type of " ++ printTree x
  EApp f e -> do
    vf  <- inferExp env f
    wvf <- whnf env vf
    case wvf of
      VClos (EProd x a b) g -> do
        checkExp env e (VClos a g)
        return $ VClos b ((x, VClos e (subst env)) : g)
      _ -> fail $ "product type expected for " ++ printTree f ++ " but found " ++ printVal vf
     
  EProd x a b -> do  -- moved here from checkExp
    checkType env a
    let i = gen env
    let env' = env{
            gen = i+1,
            subst   = (x,VGen (i+1))           : subst(env),
            context = (x,VClos a (subst(env))) : context(env)
            }
    checkType env' b
    return tType

  -- records not in TC paper
  ERecTyp -> return tType

  ERecord fs | isRecType exp -> do
    checkRectypeFields env fs 
    return tRecType
    
  EProj r l -> do
    vr  <- inferExp env r
    wvr <- whnf env vr
    case wvr of
      VClos e@(ERecord ftys) g | isRecType e -> do
        let (rbeg,rend) = break ((==l) . fst) [(k,ty) | FIn k ty <- ftys] ---- TODO: manifest fields
        case rend of
          [] -> fail $ "type error: unknown record label " ++ printTree l ++ " in " ++ printTree r  --- could be checked earlier
          (_,ty):_ -> return $ VClos ty ([(x,VClos (EProj r x) (subst env)) | (x,_) <- rbeg] ++ g) 
      _ -> fail $ "projection of " ++ printTree l ++ ": record type expected for " ++ printTree r ++ " but found " ++ printVal wvr

  EInt _ -> return tInt
  EFloat _ -> return tFloat
  EStr _ -> return tString

  EMul x y -> inferArithmExp env x y
  EDiv x y -> inferArithmExp env x y
  EAdd x y -> inferArithmExp env x y
  ESub x y -> inferArithmExp env x y
  ECat x y -> do
    checkExp env x tString
    checkExp env y tString
    return tString

  EUnion  a b -> checkType env a >> checkType env b >> return tType
  EInters a b -> checkType env a >> checkType env b >> return tType
  EMerge  a b -> checkType env a >> checkType env b >> return tType
  EConcat a b -> checkType env a >> checkType env b >> return tType
  EJoin a _ b -> checkType env a >> checkType env b >> return tType
  ECompl a    -> checkType env a >> return tType

  _ -> fail $ "cannot infer type of: " ++ printTree exp

checkRecordFields env fetys = case fetys of
  (x,e,ty) : fetys2 -> do
    checkExp env e (VClos ty (subst(env)))
    let env' = env {subst = (x, VClos e (subst(env))) : subst env}
    checkRecordFields env' fetys2
  _ -> return ()

checkRectypeFields env fs = case fs of
  FIn lab ty : fs2 -> do
    checkType env ty
    let env' = env {
      gen = gen env + 1,
      context = (lab,VClos ty (subst(env))) : context env,
      subst = (lab,VGen (gen env)) : subst env
      }
    checkRectypeFields env' fs2
  _ -> return () ---- TODO: manifest fields

inferArithmExp env x y = do
  checkExp env x tInt
  checkExp env y tInt
  return tInt ---- TODO Float

----

-- reduce to unary applications and abstractions: then we don't need to care about these forms
desugar :: Tree a -> Tree a
desugar t = case t of
  ELambs ls e -> foldr (uncurry EAbs) (desugar e) [(x,desugar ty) | LAbs x ty <- ls]
  EApps f es  -> foldl EApp (desugar f) (map desugar es)
  ELamApp ls e es -> desugar (EApps (ELambs ls e) es)
  EFun a b -> EProd dummyId (desugar a) (desugar b)
  _ -> composOp desugar t

checkText :: Text -> Err TCEnv
checkText text = do
  let funs = getFunctions jments
  let sig  = getSignature jments
  let env  = initTCEnv {defs = funs, headers = sig}    ---- TODO check name duplicates
  mapM_ (checkJment env) jments           --- could be done in one pass with a foldM
  return env
 where
   TJments jments = desugar text

getSignature :: [Jment] -> Signature
getSignature = concatMap sig where
  sig :: Jment -> [(Id,Val)]
  sig d = case d of
    JIn   (EId f) e   -> [(f, vClos e)]
    JEqIn (EId f) _ e -> [(f, vClos e)]
    _ -> [] ---- TODO: infer type of constant without type signature

getFunctions :: [Jment] -> Functions
getFunctions = concatMap sig where
  sig :: Jment -> [(Id,Val)]
  sig d = case d of
    JEq   (EId f) e   -> [(f, vClos e)]
    JEqIn (EId f) e _ -> [(f, vClos e)]
    JIn   (EId f) _   -> [(f, vClos (EId f))] --- canonical constant or "postulate"

checkJment :: TCEnv -> Jment -> Err ()
checkJment env jment = do
  let
   ifOld e m = case e of
     EId c | elem c (map fst (headers env)) -> m
     EInt _ -> m
     EFloat _ -> m
     EStr _ -> m
     _ -> return ()
   em = case jment of
    JIn  e t -> do
      checkType env t
      ifOld e $ checkExp env e (vClos t)
    JEqIn e d t -> do
      checkType env t
      checkExp env d (vClos t)
---- TODO      ifOld e $ do
    JEq _ e -> do
      inferExp env e
      return ()
    ---- TODO      ifOld e $ do
  case em of  
    Bad s -> fail $ s ++ "\nhappened in\n" ++ printTree jment
    _ -> return ()
