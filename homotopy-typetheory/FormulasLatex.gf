concrete FormulasLatex of Formulas = open Prelude in {

-- expressions: language-neutral
lincat 
  Exp = Str ;
  Var = Str ;
  [Var] = {s : Str ; isPl : Bool} ;
  [Exp] = {s : Str ; isPl : Bool} ;
  Format = Str ;
  MathEnv = Str * Str ;

lin
  BaseVar x = {s = x ; isPl = False} ;
  ConsVar x xs = {s = x ++ "," ++ xs.s ; isPl = True} ;

  BaseExp x = {s = x ; isPl = False} ;
  ConsExp x xs = {s = x ++ "," ++ xs.s ; isPl = True} ;

  VarExp x = x ;
  AppExp f x = appH f x ;

  DefExp a b = defineH a b ;
  TypedExp a A = typingH a.s A ;
  
  equalExp x y = equalH x y ;
  mapExp x y = arrowH x y ;
  equivalenceExp x y = equivalenceH x y ;
  identityMapExp X = idMapH X ;
  ComprehensionExp x A P = comprehensionH x A P ;

  fiberExp y A = fiberH y A ;

  lambdaExp x A b = lambdaH x A b ;

  reflexivityExp A a = reflexivityH A a ;
  equivalenceMapExp A B = equivalenceMapH A B ;

  pairExp a b = pairH a b ;
  barExp e = barH e ;
  idPropExp x y = idPropH x y ;

  a_Var = "a" ; b_Var = "b" ; f_Var = "f" ; A_Var = "A" ; B_Var = "B" ; x_Var = "x" ; y_Var = "y" ; z_Var = "z" ; u_Var = "u" ; 
  U_Var = "U" ; X_Var = "X" ; Y_Var = "Y" ;

---- latex

oper
  macro  : Str -> Str = \m -> "\\" + m ;
 
  macro0 : (f : Str) -> Str = \f -> macro f ;
  macro1 : (f,x : Str) -> Str = \f,x -> "\\" + f ++ "{" ++ x ++ "}" ;
  macro2 : (f,x,y : Str) -> Str = \f,x,y -> "\\" + f ++ "{" ++ x ++ "} {" ++ y ++ "}" ;
  macro3 : (f,x,y,z : Str) -> Str = \f,x,y,z -> "\\" + f ++ "{" ++ x ++ "} {" ++ y ++ "} {" ++ z ++ "}" ;

  optLatex : Str -> Str -> Str = \a,b -> a | b ; -- used for converting flat expression b to macro expression a

  arrowH :  (x,y : Str) -> Str = \a,b -> optLatex (macro2 "arrowH" a b) (a ++ macro "rightarrow" ++ b) ;
  equalH :  (x,y : Str) -> Str = \a,b -> optLatex (macro2 "equalH" a b) (a ++ "=" ++ b) ;
  equivalenceH :  (x,y : Str) -> Str = \a,b -> optLatex (macro2 "equivalenceH" a b) (a ++ macro "simeq" ++ b) ;
  comprehensionH :  (x,y,z : Str) -> Str = \a,b,c -> 
    optLatex (macro3 "comprehensionH" a b c) ("\\{" ++ a ++ ":" ++ b ++ macro "mid" ++ c ++ "\\}") ;
  idMapH : (x : Str) -> Str = \a -> optLatex (macro1 "idMapH" a) ("1 _ {" ++ a ++ "}") ;
  fiberH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "fiberH" a b) ("\\{" ++ a ++ "\\} _ {" ++ b ++ "}") ;
  appH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "appH" a b) (a ++ b) ;
  lambdaH : (x,y,z : Str) -> Str = \a,b,c -> optLatex (macro3 "lambdaH" a b c) (macro "lambda_{" ++ a ++ ":" ++ b ++ "}" ++ c) ;
  defineH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "defineH" a b) (a ++ ":=" ++ b) ;
  typingH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "typingH" a b) (a ++ ":" ++ b) ;
  pairH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "pairH" a b) ("(" ++ a ++ "," ++ b ++ ")") ;
  reflexivityH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "reflexivityH" a b) ("r_ {" ++ a ++ "}" ++ b) ;
  barH : (x : Str) -> Str = \a -> optLatex (macro1 "barH" a) ("\\bar {" ++ a ++ "}") ;
  idPropH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "idPropH" a b) ("(" ++ a ++ "=" ++ b ++ ")") ;
  equivalenceMapH : (x,y : Str) -> Str = \a,b -> optLatex (macro2 "equivalenceMapH" a b) ("E_ {" ++ a ++ "," ++ b ++ "}") ;

lin
  DollarMathEnv = <"$","$"> ;
  DisplayMathEnv = <"\\[","\\]"> ;

  DocumentStyleFormat = "\\documentclass{article}" ;
  CommentFormat = "%%" ;
  EmptyLineFormat = "" ;
  LatexsymFormat = "\\usepackage{latexsym}" ;
  AmsfontsFormat = "\\usepackage{amsfonts}" ;
  Utf8Format = "\\usepackage[utf8]{inputenc}" ;
  BeginDocumentFormat = "\\begin{document}" ;
  InputMacrosFormat = "\\input{macros}" ;
  BeginItemizeFormat = "\\begin{itemize}" ;
  ItemFormat = "\\item" ;
  EndItemizeFormat = "\\end{itemize}" ;
  EndDocumentFormat = "\\end{document}" ;
  
}