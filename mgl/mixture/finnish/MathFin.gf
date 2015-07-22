{-
    Copyright 2006,2008 WebALT Inc.
    This file is part of the Mathematical Grammar Library, MGL.

    MGL is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    MGL is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with MGL.  If not, see <http://www.gnu.org/licenses/>.


 History:
 $Rev::               $:  Revision of last commit
 $Author:: caprotti   $:  Author of last commit
 $Date:: 2008-09-29 1#$:  Date of last commit

-}

--# -path=.:../lexicon:prelude:present:mathematical

instance MathFin of Math = MathI - [
  DefGenCN, DefGenCNOrd, DefGenCNidx,
  MathVar, mkVar, useVar, var2str, useVarPlus    --useQualVar
  ]
with
    (Cat = CatFin),
    (Syntax = SyntaxFin), 
    (Symbolic = SymbolicFin), 
    (Lexicon = LexiconFin) **
open
    (X = ConstructX),
    (P = ParadigmsFin),
    (S = SyntaxFin),
    (M = MorphoFin) ---- mkVar
in {

--flags optimize = noexpand ;

oper

      DefGenCN : CN -> MathObj -> MathObj = \cn,obj -> 
        let noun2 = CNtoN2 cn
        in  mkNP (mkCN noun2 obj) ;

      DefGenCNOrd : CN -> Ord -> MathObj -> MathObj =
        \cn,ord,obj -> 
          let noun2 = CNtoN2 cn
          in  mkNP (mkDet the_Art ord) (mkCN noun2 obj) ;
    
      DefGenCNidx : CN -> MathObj -> MathIdx -> MathObj =
        \cn,obj,i ->
          let noun2 = CNtoN2 cn
          in  mkNP (mkDet the_Quant (mkOrd i.v)) (mkCN noun2 obj) ;

      then_Adv = P.mkAdv "niin" ;
      elem_Prep = my_possess_Prep ;
      fromAdv : Str -> CN -> CN = \s,cn ->
          mkCN cn (P.mkAdv s) ; 
      -- only used in Limit1Fin, and we can give the Str
      -- in the right inflection form there.


oper  CNtoN2 : CN -> N2 = \cn->
          let noun = lin N {s = cn.s}
          in  P.mkN2 noun (P.casePrep P.genitive) ;

  MathVar = PN ;
  mkVar : Str -> MathVar = \s -> P.mkPN (M.nForms2N (M.dSDP s)) ; --- mkN too slow

  useVar : MathVar -> MathObj = \v -> S.mkNP v ;
  useVarPlus : MathVar -> MathObjPlus = \v -> mkMathObj (constant (var2str v));  

--  useQualVar : CN -> MathVar -> MathObj = \cn, v -> S.mkNP the_Det (S.mkCN cn (S.mkNP v)) ; --moved to PlanGeo1Fin

  var2str : MathVar -> Str = \x -> (mkUtt (mkNP x)).s ;

  var2SS :  MathVar -> SS = \x -> mkUtt (mkNP x) ;     --for L.lins in mixture where SS is needed and we give a MathVar

}
