--# -path=.:../../lib/prelude
concrete ImperC of Imper = open ResImper in {
  flags lexer=codevars ; unlexer=code ; startcat=Program ;

  lincat
    Exp = PrecExp ; 
    Typ = {s,s2 : Str} ;
    Rec = {s,s2,s3 : Str} ;

  lin
    Empty = ss [] ;
    FunctNil val stm cont = ss (
      val.s ++ cont.$0 ++ paren [] ++ "{" ++ 
      stm.s ++ "}" ++ ";" ++ cont.s) ;
    Funct args val rec = ss (
      val.s ++ rec.$0 ++ paren rec.s2 ++ "{" ++ 
      rec.s ++ "}" ++ ";" ++ rec.s3) ;

    RecOne typ stm prg = stm ** {
      s2 = typ.s ++ stm.$0 ;
      s3 = prg.s
      } ;
    RecCons typ _ body prg = {
      s  = body.s ; 
      s2 = typ.s ++ body.$0 ++ "," ++ body.s2 ;
      s3 = prg.s
      } ;

    Decl  typ cont = continues (typ.s ++ cont.$0) cont ;
    Assign _ x exp = continues (x.s ++ "=" ++ exp.s) ;
    While exp loop = continue  ("while" ++ paren exp.s ++ loop.s) ;
    IfElse exp t f = continue  ("if" ++ paren exp.s ++ t.s ++ "else" ++ f.s) ;
    Block stm      = continue  ("{" ++ stm.s ++ "}") ;
    Printf t e     = continues ("printf" ++ paren (t.s2 ++ "," ++ e.s)) ;
    Return _ exp   = statement ("return" ++ exp.s) ;
    Returnv        = statement "return" ;
    End            = ss [] ;
 
    EVar  _ x  = constant x.s ;
    EInt    n  = constant n.s ;
    EFloat a b = constant (a.s ++ "." ++ b.s) ;
    EMul _ _   = infixL 3 "*" ;
    EAdd _ _   = infixL 2 "+" ;
    ESub _ _   = infixL 2 "-" ;
    ELt _ _    = infixN 1 "<" ;

    EAppNil val f = constant (f.s ++ paren []) ;
    EApp args val f exps = constant (f.s ++ paren exps.s) ;

    TInt    = {s = "int" ; s2 = "\"%d\""} ; 
    TFloat  = {s = "float" ; s2 = "\"%f\""} ;
    NilTyp  = ss [] ;
    ConsTyp = cc2 ;
    OneExp _ e = e ;
    ConsExp _ _ e es = ss (e.s ++ "," ++ es.s) ;
}
