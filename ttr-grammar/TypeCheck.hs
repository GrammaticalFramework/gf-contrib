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
  EProd x a b -> do
    let i = gen env
    vtyp <- whnf env typ
    if not (elem vtyp [tType,tRecType])
      then fail ("expected Type or RecType for: " ++ printTree exp)
      else checkType (
          env{
            gen = i+1,
            subst = (x,VGen (i+1)):subst(env),
            context = (x,VClos a (subst(env))):context(env)
            }
          )
        b
        
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
lookVarType :: TCEnv -> Id -> Err Type
lookVarType env@(_,(sig,cont)) c = case lookup c cont of
  Just t -> return t
  _ -> case lookup c sig of
    Just v -> return v
    _ -> return $ tInd  ---- since constants may not have been declared
----    _ -> fail $ "unknown identifier " ++ printTree c

getProd :: Exp -> ([(Id,Type)],Type)
getProd e = case e of
  EProd x typ b ->    ((x,typ) : args, val) where (args,val) = getProd b
  EFun typ b -> ((dummyId,typ) : args, val) where (args,val) = getProd b
  _ -> ([],e)


checkCompatibleType :: TCEnv -> Type -> Type -> Err () -- Exp for printing error msg
checkCompatibleType env@(sig,_) typ ityp = do
  ctyp  <- evalype env typ
  cityp <- evalType env ityp
  case (ctyp,cityp) of
    (EProd _ ty1 v1, EProd _ ty2 v2) | ty1 == ty2 -> checkCompatibleType env v1 v2
       ---- TODO check contravariance in arg types
    (EProd _ ty1 v1, EFun    ty2 v2) | ty1 == ty2 -> checkCompatibleType env v1 v2
       ---- TODO also substitute in type body for dep
    (EFun    ty1 v1, EProd _ ty2 v2) | ty1 == ty2 -> checkCompatibleType env v1 v2
    _ | ctyp == cityp -> return ()
       ---- TODO covariant subtyping
    _ -> fail $ "type expected: " ++ printTree typ ++ " inferred: " ++ printTree ityp
         ++ "\nDEBUG ENV " ++ show env
         
evalType env@(sig,_) typ = do
  val <- eval "-s" (sig,[]) typ
  case val of
    VClos [] e [] -> return e
    _ -> fail $ "no legal type from " ++ printVal val

checkExp :: TCEnv -> Exp -> Type -> Err ()
checkExp env@(_,(sig,cont)) exp typ = case exp of

  _ -> do
    ityp <- inferExp env exp
    checkCompatibleType env typ ityp

inferExp :: TCEnv -> Exp -> Err Type
inferExp env@(th,(sig,cont)) exp = case exp of
  EId x -> lookVarType env x
  EInt _ -> return tInt
  EFloat _ -> return tFloat
  EStr _ -> return tString

  EApps f es -> do
    ftyp  <- inferExp env f
    let (argtyps,valtyp) = getProd ftyp
    if length argtyps /= length es                        ---- TODO partial application
      then fail ("too many arguments given in " ++ printTree exp)
      else checkApps env [] (zip es argtyps) valtyp
        
  ELamApp lambdas body es -> inferExp env (EApps (ELambs lambdas body) es)
  
  EProj rec lab -> do
    rectyp0 <- inferExp env rec
    rectyp <- evalType env rectyp0 
    case rectyp of
      ERecord fs -> case lookup lab ([(i,t) | FIn i t <- fs] ++ [(i,t) | FEqIn i _ t <- fs]) of
                    ---- TODO check against type-annotated field and manifest fields
        Just t -> return t
        _ -> fail $ "Type error: unknown record label " ++ printTree lab ++ " in " ++ printTree rectyp 
      _ -> fail $ "Type error: projecting " ++ printTree lab ++ " from non-record " ++ printTree rec
      
  ELambs lambdas body -> do
    let args = [(x,typ) | LAbs x typ <- lambdas]
    val <- inferExp (th,(sig, args++cont)) body 
    return $ foldr (uncurry EProd) val args

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

  checkApps env@(defs,_) g expstyps valtyp = case expstyps of
    (e,(x,ty)):expstyps2 -> do
      val@(VClos [] ty' _) <- eval "-s" (defs,g) ty ---- [] ??
      checkExp env e ty'
      let g' = (x,val) : g
      checkApps env g' expstyps2 valtyp
    _ -> do
      VClos [] ty _ <- eval "-s" (defs,g) valtyp
      return ty

-}