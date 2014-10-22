concrete FormulasLogic of Formulas = open Prelude in {

-- expressions: language-neutral
lincat 
  Exp = Str ;
  Var = Str ;
  [Var] = {s : Str ; isPl : Bool} ;
  [Exp] = {s : Str ; isPl : Bool} ;
  Format = Str ;
  MathEnv = Str ;

lin
  BaseVar x = {s = x ; isPl = False} ;
  ConsVar x xs = {s = x ++ "," ++ xs.s ; isPl = True} ;

  BaseExp x = {s = x ; isPl = False} ;
  ConsExp x xs = {s = x ++ "," ++ xs.s ; isPl = True} ;

  VarExp x = x ;
  AppExp f x = f ++ parenth x ;

  DefExp a b = defineH a b ;
  TypedExp a A = typingH a.s A ;
  
  equalExp x y = fun2 "Id" x y ;
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

---- macros
oper
  parenth : Str -> Str = \m -> "(" ++ m ++ ")" ;
 
  fun1 : (f,x : Str) -> Str = \f,x -> f ++ parenth x ;
  fun2 : (f,x,y : Str) -> Str = \f,x,y -> f ++ parenth x ++ parenth y ;
  fun3 : (f,x,y,z : Str) -> Str = \f,x,y,z -> f ++ parenth x ++ parenth y ++ parenth z ;

  arrowH :  (x,y : Str) -> Str = \a,b -> a ++ "->" ++ b ;
  equalH :  (x,y : Str) -> Str = \a,b -> a ++ "=" ++ b ;
  typingH : (x,y : Str) -> Str = \a,b -> a ++ ":" ++ b ;
  equivalenceH :  (x,y : Str) -> Str = \a,b -> fun2 "equivalence" a b ;
  comprehensionH :  (x,y,z : Str) -> Str = \a,b,c -> fun3 "comprehension" a b c ;
  idMapH : (x : Str) -> Str = \a -> fun1 "idMap" a ;
  fiberH : (x,y : Str) -> Str = \a,b -> fun2 "fiber" a b ;
  appH : (x,y : Str) -> Str = \a,b -> fun2 "app" a b ;
  lambdaH : (x,y,z : Str) -> Str = \a,b,c -> parenth ("\\" ++ arrowH (typingH a b) c) ;
  defineH : (x,y : Str) -> Str = \a,b -> a ++ ":=" ++ b ;
  pairH : (x,y : Str) -> Str = \a,b -> "<" ++ a ++ "," ++ b ++ ">" ;
  reflexivityH : (x,y : Str) -> Str = \a,b -> fun2 "refl" a b ;
  barH : (x : Str) -> Str = \a -> fun1 "bar" a ;
  idPropH : (x,y : Str) -> Str = \a,b -> fun2 "Id" a b ;
  equivalenceMapH : (x,y : Str) -> Str = \a,b -> fun2 "EqMap" a b ;

lin
  DollarMathEnv = [] ;
  DisplayMathEnv = [] ;

  DocumentStyleFormat = "-- article" ;
  CommentFormat = "--" ;
  EmptyLineFormat = "" ;
  Utf8Format = "" ;
  LatexsymFormat = "" ;
  AmsfontsFormat = "" ;
  BeginDocumentFormat = "" ;
  InputMacrosFormat = "" ;
  BeginItemizeFormat = "" ;
  ItemFormat = "" ;
  EndItemizeFormat = "" ;
  EndDocumentFormat = "" ;
  
}