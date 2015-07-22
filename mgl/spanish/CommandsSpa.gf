--# -path=present:../abstract:../resources

concrete CommandsSpa of Commands  =
    GroundSpa, 
    OpenMathSpa,
    BinaryOpsSpa
** 
CommandsI - [
  Simple, Assigned, Asserted, YesApprox,
  itNum, itSet, itTensor]
with
    (Lexicon = LexiconSpa),
    (Math = MathSpa),
    (Syntax = SyntaxSpa),
    (Common = CommonRomance),
    (Symbolic = SymbolicSpa),
    (Cat = CatSpa)
**
open
  ExtraSpa,
	(P = ParadigmsSpa),
	ResSpa
in
{
flags
	coding = utf8 ;
oper
	ImpP3Assign: NP -> NP -> Utt =
		\np1,np2 -> lin Utt{s = "sea" ++ (np1.s ! Nom).ton ++ "igual a" ++ (np2.s ! Nom).ton } ;

 	now_Adv 		= P.mkAdv "ahora" ;   --not in Lexicon since P.mkAdv is in conflict with Constructors

  end_V2 = P.mkV2 end_V from_Prep ;

  esto_NP : NP = mkNP (P.mkPN "esto") ;

  pit_NP : N -> NP = \n -> variants {
    mkNP this_Det (mkCN n) ;
    esto_NP } ;

lin
  itNum    = pit_NP number_N;
  itSet    = pit_NP set_N;
  itTensor = esto_NP ;

   --     addTo x y = mkText( mkUtt (mkImp (mkVP add_V3 x y))); 
	   
 	Simple _ x 	= mkText (mkCl (mkNP (P.mkPN "")) x) ; 

   	Assigned _ x y  = variants{
				mkText (mkS now_Adv (mkS (mkCl (useVar x) valer_V2 y)));               -- x es ahora 2
				mkText (mkS (mkClause [] True False (Ag Masc Sg P1) (mkVP assign_V3 y (useVar x)) ))  --anteriorAnt
				--assignedNAP y (useVar x))         			      -- 2 is assigned to x                   
				};

	AssignedFun f x np = mkText (mkS now_Adv (mkS (mkCl (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) valer_V2 np)));

   	Asserted p = mkText (mkClause [] True False (Ag Masc Sg P1) (mkVP assume_VS p)) ;

 	YesApprox n = mkText (mkText (mkPhr yes_Utt)) (mkText (mkUtt (mkAdv with_Prep (mkNP n (mkCN decimal_A place_N)) ))) ; 

{-
  EndBlock name =
    mkText (mkPhr (mkImp ( mkVP (mkVP end_V) (mkAdv possess_Prep (mkNP the_Det (mkCN block_N (mkNP (P.mkPN name.s)))))))); 
  
  BegunBlock name =
    mkText (mkS now_Adv (mkS (mkClause [] True False (Ag Masc Pl P1)
					(mkVP begin_V2 (mkNP the_Det (mkCN block_N (mkNP (P.mkPN name.s)))))))); 

  EndedBlock name =
    mkText (mkS now_Adv (mkS (mkClause [] True False (Ag Masc Pl P1)
 					(mkVP (mkVP end_V) (mkAdv possess_Prep (mkNP the_Det (mkCN block_N (mkNP (P.mkPN name.s))))))))); 
-}  			
}
