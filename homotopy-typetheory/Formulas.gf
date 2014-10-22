abstract Formulas = {

-- expressions are defined only as for arity

cat
  Exp ;          -- formal expression             -- x + y = z
  Var ;          -- variable                      -- x
  [Var]{1} ;     -- list of variables             -- x, y, z
  [Exp]{1} ;     -- list of expressions           -- 1_{A}, A
  Format ;       -- line other than content       -- \begin{document}
  MathEnv ;      -- math environment              -- $ ... $

fun
  ComprehensionExp : Var -> Exp -> Exp -> Exp ;   -- {x : A | P}

  a_Var, b_Var, f_Var, u_Var, x_Var, y_Var, z_Var, 
  A_Var, B_Var, U_Var, X_Var, Y_Var : Var ;

  VarExp : Var -> Exp ;                        -- x
  AppExp : Var -> Exp -> Exp ;                 -- f x

  DefExp          : Exp   -> Exp -> Exp ;      -- f := b
  TypedExp        : [Exp] -> Exp -> Exp ;      -- X, Y : B

  equalExp        : Exp -> Exp -> Exp ;        -- A = B
  mapExp          : Exp -> Exp -> Exp ;        -- A \rightarrow B
  equivalenceExp  : Exp -> Exp -> Exp ;        -- A \simeq B
  identityMapExp  : Exp -> Exp ;               -- 1_A
  fiberExp        : Exp -> Exp -> Exp ;        -- {y}A
  pairExp         : Exp -> Exp -> Exp ;        -- (a,b)
  lambdaExp       : Var -> Exp -> Exp -> Exp ; -- lambda x : A . b
  reflexivityExp  : Exp -> Exp -> Exp ;        -- r_ A a
  barExp          : Exp -> Exp ;               -- e with a bar above
  idPropExp       : Exp -> Exp -> Exp ;        -- (x = y)
  equivalenceMapExp : Exp -> Exp -> Exp ;      -- E_X,Y

  DollarMathEnv  : MathEnv ; -- $ .. $
  DisplayMathEnv : MathEnv ; -- \[ .. \]

--- latex formatting

  DocumentStyleFormat : Format ;
  CommentFormat : Format ;
  EmptyLineFormat : Format ;
  Utf8Format : Format ;
  LatexsymFormat : Format ;
  AmsfontsFormat : Format ;
  BeginDocumentFormat : Format ;
  InputMacrosFormat : Format ;
  BeginItemizeFormat : Format ;
  ItemFormat : Format ;
  EndItemizeFormat : Format ;
  EndDocumentFormat : Format ;

}