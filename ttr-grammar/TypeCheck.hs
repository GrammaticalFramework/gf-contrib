{-# LANGUAGE GADTs #-}
module TypeCheck where

----import Evaluate

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

baseConstants = [(t, vId t) | (t,_) <- baseTypings]

vClos e = VClos e []
vId c = vClos (EId c)

dummyId = Id "_"

printVal v = case v of
  VApp u v -> printVal u ++ "(" ++ printVal v ++ ")"
  VClos e [] -> printTree e
  _ -> show v

evalExp :: TCEnv -> Exp -> Err Val
evalExp env exp = whnf env (VClos exp []) ----

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
    ---- TODO proj

    _ -> return $ VClos exp g


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
        else fail ("type equality fails: " ++ printVal wu ++ " <> " ++ printVal wv)

checkType :: TCEnv -> Exp -> Err ()
checkType env e = checkExp env e tType  ---- TODO rectype

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
  EProd x a b -> do
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
        
  _ -> do
    typ0 <- inferExp env exp
    eqVal env typ typ0

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
  ERecTyp -> return tType
  _ -> fail $ "inference not yet: " ++ printTree exp
  
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
   em = case jment of
    JIn   (EId f) t -> checkType env t
    JEqIn (EId f) e t -> do
        checkType env t
        checkExp env e (vClos t)
    _ -> return () ---- TODO: infer type of constant without type signature
  case em of  
    Bad s -> fail $ s ++ "\nhappened in\n" ++ printTree jment
    _ -> return ()


{-
  EProj rec lab -> do
    rectyp0 <- inferExp env rec
    rectyp <- evalType env rectyp0 
    case rectyp of
      ERecord fs -> case lookup lab ([(i,t) | FIn i t <- fs] ++ [(i,t) | FEqIn i _ t <- fs]) of
                    ---- TODO check against type-annotated field and manifest fields
        Just t -> return t
        _ -> fail $ "Type error: unknown record label " ++ printTree lab ++ " in " ++ printTree rectyp 
      _ -> fail $ "Type error: projecting " ++ printTree lab ++ " from non-record " ++ printTree rec

  ERecord fs | not (null [() | FIn _ _ <- fs]) -> return tRecType ---- TODO check the other types
  ERecord fs -> do
    fs' <- mapM inferField fs
    return $ ERecord [FIn l ty | (l,ty) <- fs']
    ---- can also be ERecType with only manifest fields
  

  _ -> return tType ---- for types
  
 where
  inferField f = case f of

----    FIn l t -> return (l,t) --- captured by an earlier case
    FEqIn l e t -> do
      checkExp env e t
      return (l,t)
    FEq l e -> do
      t <- inferExp env e
      return (l,t)

-}