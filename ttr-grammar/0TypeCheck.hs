module TypeCheck where

import Evaluate

import AbsTTR
import PrintTTR
import ErrM

type TCEnv     = (Sig,(Signature,Context))  -- Sig has definitions of type synonyms
type Signature = [(Id,Type)]
type Context   = [(Id,Type)]

type Type = Exp
tInd  = EId (Id "ind")
tType = EId (Id "Type")
tInt = EId (Id "Int")
tString = EId (Id "String")
tFloat = EId (Id "Float")
tRecType = ERecTyp

dummyId = Id "_"

checkText :: Text -> Err TCEnv
checkText text@(TJments jments) = do
  let defs = getSig jments
  let sig  = getSignature jments
  let env  = (defs,(sig,[]))    ---- TODO check name duplicates
  mapM_ (checkJment env) jments --- could be done in one pass with a foldM
  return env

getSignature :: [Jment] -> Signature
getSignature = concatMap sig where
  sig d = case d of
    JIn   (EId f) e   -> [(f, e)]
    JEqIn (EId f) _ e -> [(f, e)]
    _ -> [] ---- TODO: infer type of constant without type signature

checkJment :: TCEnv -> Jment -> Err ()
checkJment env jment = case jment of
  JIn   (EId f) t   -> return () ---- TODO check that t is a valid type
  JEqIn (EId f) e t -> do
    case checkExp env e t of
      Bad s -> fail $ s ++ "\nhappened in\n" ++ printTree jment
      _ -> return ()
  _ -> return () ---- TODO: infer type of constant without type signature
  
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
  ctyp  <- evalType env typ
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