--# -path=present:../abstract:../resources

concrete CommandsGer of Commands =
    GroundGer, 
    OpenMathGer,
    BinaryOpsGer
**
    CommandsI - [Assert, Assigned, AssignedFun, assignedNAP, addTo]
with
    (Lexicon = LexiconGer),
    (Math = MathGer),
    (Symbolic = SymbolicGer),
    (Cat = CatGer),
    (Syntax = SyntaxGer)	
**
open
  ResGer,
  (P  = ParadigmsGer)
in
{
oper
	ImpP3Assign: NP -> NP -> Utt =
		\np1,np2 -> lin Utt{s = "sei" ++ (np1.s ! NPC Nom) ++ "gleich" ++ (np2.s ! NPC Nom)} ;   --TODO: gleich could be ommited vor non symbolic np2
		--!! there exists ImpP3 in Idiom.Ger (but not in IdiomSpa!), which gives "sei x y."

       	relation_cl_NAP : MathObj -> MathObj -> Cl = \np1,np2 -> mkCl np1 (equal_to np2) ;

       	now_Adv = P.mkAdv "jetzt" ; --not in Lexicon since P.mkAdv is in conflict with Constructors

lin
	addTo x y = mkTxtVP (mkVP add_V2 y) ;                        --addiere dazu y
--case x of {
--			itNum  =>  mkTxtVP (mkVP add_V2 y)-- ;                        --addiere dazu y
	--		_      =>  mkTxtVP (mkVP add2_V2 (mkNP and_Conj x y))         --addiere x und y
--			};
	
 	Assigned _ x y  = mkText (mkS now_Adv (mkS (relation_cl_NAP (useVar x) y))) ;

        AssignedFun f x np  = mkText (mkS now_Adv (mkS (relation_cl_NAP (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) np))) ;

	Assert p 	= mkText (mkPhr (mkUtt (my_mkAP (mkAP (P.mkA ["angenommen ,"])) p))) ;
}
