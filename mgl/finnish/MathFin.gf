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
  lambda_fn, at_fn, flwrt, flwrtNP,
  DefGenCN, DefGenCNOrd, DefGenCNidx,
  MathVar, mkVar, useVar, var2str, limitTendNP    --useQualVar
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
    (E = ExtraFin),
    (M = MorphoFin) ---- mkVar
in {

--flags optimize = noexpand ;

oper
    lambda_fn : MathVar -> MathObj -> MathFunc = \x,f ->
      NPfn (mkNP the_Det (mkCN (mkCN (P.mkN "funktio")) (mkRS (mkRCl which_RP (mkVP (P.dirdirV3 (P.mkV "kuvata" "kuvasi")) (mkNP x) f))))) ;

    at_fn : MathFunc -> MathObj -> MathObj = \f,x -> 
      NPfn (mkNP (mkNP (E.GenNP f) (P.mkN "arvo")) (SyntaxFin.mkAdv in_Prep (mkNP the_Det (mkCN (P.mkN "piste") x)))) ;

{-
        case f.t of {
            FNoVar => variants {} ; --TODO
            FGral => NPfn (adverbNP (atAdv x) f) ;
            FNamed => NPfn (mkNP (mkNP (E.GenNP f) (P.mkN "arvo")) (SyntaxFin.mkAdv in_Prep (mkNP the_Det (mkCN (P.mkN "piste") x)))) ;
            FVar => NPfn (adverbNP (whereIs (useVar f.s2) x) f)
        } ;
-}

    flwrt : CN -> MathFunc -> MathFunc = \n,f ->
      NPfn (DefGenCN n f) ;
{-
        let np = DefGenCN n
        in case f.t of {
            FVar => variants {
                        NPfn (np (respect f.s2 f)) ;
                        NPfn (np f) } ;
            _ => NPfn (np f)
        } ;
-} 

flwrtNP : Ord -> CN -> MathFunc -> MathFunc = \ord,cn,f ->
  <mkNP (E.GenNP f) singularNum ord cn : NP> ** {t= FGral; s2= NullVar} ;

{-
        let np = DefGenCNOrd cn ord
        in case f.t of {
            FVar => NPfn (np (respect f.s2 f)) ;
            _ => NPfn (np f)
        } ;
-}

      DefGenCN : CN -> MathObj -> MathObj = \cn,obj -> 
        mkNP (E.GenNP obj) cn ;
--        let noun2 = CNtoN2 cn
--        in  mkNP (mkCN noun2 obj) ;

      DefGenCNOrd : CN -> Ord -> MathObj -> MathObj =
        \cn,ord,obj -> 
          let noun2 = CNtoN2 cn
          in  mkNP (mkDet the_Art ord) (mkCN noun2 obj) ;
    
      DefGenCNidx : CN -> MathObj -> MathIdx -> MathObj =
        \cn,obj,i ->
          let noun2 = CNtoN2 cn
          in  mkNP (mkDet the_Quant (mkOrd i)) (mkCN noun2 obj) ;

      then_Adv = P.mkAdv "niin" ;
      elem_Prep = my_possess_Prep ;
      fromAdv : Str -> CN -> CN = \s,cn ->
          mkCN cn (P.mkAdv s) ; 
      -- only used in Limit1Fin, and we can give the Str
      -- in the right inflection form there.


oper  CNtoN2 : CN -> N2 = \cn->
          let noun = lin N cn
          in  P.mkN2 noun (P.casePrep P.genitive) ;

  MathVar = PN ;
  mkVar : Str -> MathVar = \s -> P.mkPN (M.nForms2N (M.dSDP s)) ; --- mkN too slow
  useVar : MathVar -> MathObj = \v -> S.mkNP v ;

--  useQualVar : CN -> MathVar -> MathObj = \cn, v -> S.mkNP the_Det (S.mkCN cn (S.mkNP v)) ; --moved to PlanGeo1Fin

  var2str : MathVar -> Str = \x -> (mkUtt (mkNP x)).s ;


    limitTendNP  : (Tends => CnCn) -> MathObj -> STends -> MathVar -> MathObj -> MathObj = 
      \tcncn,x0,st,x,fx ->
        let
            hacked_x = ss (var2str x ++ st.s) ;  -- Hack: The parser must find a non-empty string (st.s = [])
            limit = limitCN x0 x fx ; ---- x0 hacked_x fx ;
            t = st.t ;
        in DefSgNP ((tcncn!t) limit) ;

}
