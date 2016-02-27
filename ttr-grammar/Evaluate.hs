{-# LANGUAGE GADTs #-}
module Evaluate where

import AbsTTR
import PrintTTR
import ErrM

data Val = VClos [Id] Exp Subst  -- decomposing lambda abstracts
  deriving (Eq,Show)

type Env     = (Sig,Subst)
type Sig     = [(Id,Val)]
type Subst = [(Id,Val)]

type Strategy = String
byName = "-n"
byValue = "-v"

getSig :: [Jment] -> Sig
getSig = concatMap sig where
  sig :: Jment -> [(Id,Val)]
  sig d = case d of
    JEq   (EId f) e   -> [(f, vClos e)]
    JEqIn (EId f) e _ -> [(f, vClos e)]
    _ -> []

vClosC :: Exp -> Subst -> Val
vClosC exp g = VClos vars body g
  where
    (vars,body) = decomposeLambda exp

vClos e = vClosC e []

val2exp (VClos _ e _ ) = e ---- used only for results of constructor applications ; cannot reconstruct types of lambdas

printVal v = case v of
  VClos [] e g -> printTree e ---- ++ printSubst g
  VClos xs e g -> "\\" ++ unwords (map printTree xs) ++ " . " ++ printTree e ---- ++ printSubst g

printSubst g = case g of
  [] -> ""
  _ -> "{" ++ unwords [printTree x ++ " ::= " ++ printVal v ++ ";" | (x,v) <- g] ++ "}"

decomposeLambda :: Exp -> ([Id],Exp)
decomposeLambda e = case e of
 ELambs lambdas exp -> ([x | LAbs x _ <- lambdas],exp)  --- assuming exp has no lambdas...
 _ -> ([],e)

lookVar :: Env -> Id -> Err Val
lookVar env@(sig,cont) c = case lookup c cont of
  Just v -> return v
  _ -> case lookup c sig of
    Just v -> return v
    _ -> return $ vClos (EId c) ---- since constants may not have been declared
----    _ -> fail $ "unknown identifier " ++ printTree c

updates (sig,cont) subst = (sig, subst ++ cont)

eval :: Strategy -> Env -> Exp -> Err Val
eval strat env@(sig,cont) exp = case exp of
  EId x -> do
    v <- lookVar env x
    case v of
      VClos [] (EId y) [] | y == x -> return v ---- constant
      VClos [] e g -> evals (updates env g) e  -- needed for 0-place functions
      _ -> return v
      
  EApps f es -> do
    f'  <- evals env f
    es' <- if strat == byName 
             then return $ [vClosC e cont | e <- es]
             else mapM (evals env) es
    case f' of
      VClos xs b g | length xs == length es' -> evals (sig,(zip xs es') ++ g) b  ---- what about partial app??
      VClos [] (EId c) g -> return $ vClos (EApps (EId c) (map val2exp es'))     ---- constructor app 
      _ -> fail $ "failed to evaluate " ++ printVal f' ++ " with " ++ unwords (map printVal es')

  ELamApp lambdas body es -> evals env $ EApps (ELambs lambdas body) es

  EProj rec0 lab -> do
    vrec <- evals env rec0
    case vrec of
      VClos [] (ERecord fs) g -> case lookup lab ([(i,e) | FEq i e <- fs] ++ [(i,e) | FEqIn i e _ <- fs]) of
        Just e -> evals (sig, g) e
        _ -> fail $ "unknown record label " ++ printTree lab ++ " in " ++ printVal vrec 
      _ -> fail $ "projecting " ++ printTree lab ++ " from non-record " ++ printVal vrec
      
  ELambs _ _ -> return $ vClosC exp cont

  ERecord fs -> do
    fs' <- mapM evalField fs
    return $ vClosC (ERecord fs') cont

  _ -> return $ vClosC exp cont --- for base values
  
 where
  evals = eval strat

  evalField f = case f of
    FEq l e -> case evals env e of
      Ok (VClos [] e' _) -> return (FEq l e')
      _ -> return (FEq l e)  -- don't destroy abstracts
    FEqIn l e t -> do
      FEq _ e' <- evalField (FEq l e)
      VClos [] t' _ <- evals env t
      return (FEqIn l e' t')
    FIn l t -> do
      FEq _ t' <- evalField (FEq l t)
      return (FIn l t')



      

