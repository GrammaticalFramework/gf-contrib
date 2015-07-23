--# -path=present:../abstract:../resources

concrete CommandsCat of Commands  =
    GroundCat, 
    OpenMathCat,
    BinaryOpsCat
** 
CommandsI - [
    Simple, Assigned, AssignedFun, Assert, Asserted, YesApprox,
    itNum, itSet, itTensor]
with
    (Lexicon = LexiconCat),
    (Math = MathCat),
    (Syntax = SyntaxCat),
    (Common = CommonRomance),
    (Symbolic = SymbolicCat),
    (Cat = CatCat)	
**
open
    ExtraCat,
    (P = ParadigmsCat),
    ResCat
    -- Prelude
in
{
flags
	coding = utf8 ;

oper
	ImpP3Assign: NP -> NP -> Utt =
		\np1,np2 -> lin Utt{s = "sigui" ++ (np1.s ! Nom).ton ++ "igual a" ++ (np2.s ! Nom).ton } ;

 	now_Adv 		= P.mkAdv "ara" ;    --not in Lexicon since P.mkAdv is in conflict with Constructors
    block_CN: SS -> CN = \name -> mkCN block_N (symb name);

    end_V2 = P.mkV2 end_V from_Prep ;

    aixo_NP : NP = mkNP (P.mkPN "això") ;

    pit_NP : N -> NP = \n -> variants {
        mkNP this_Det (mkCN n) ;
        aixo_NP } ;

lin

  itNum    = pit_NP number_N ;
  itSet    = pit_NP set_N ;
  itTensor = aixo_NP ;

 --      addTo x y = mkText( mkUtt (mkImp (mkVP add_V3 x y))); 
              
        
        Simple _ x = mkText (mkCl (mkNP (P.mkPN "")) x) ;


   	Assigned _ x y  = variants{
				mkText (mkS now_Adv (mkS (mkCl (useVar x) valer_V2 y)));               		-- ara x val y 
				mkText (mkS (mkClause [] True False (Ag Masc Sg P1) (mkVP assign_V3 y (useVar x))))  
														--assigno y a x . (falta anteriorAnt -> he assignat)
				--assignedNAP y (useVar x)         			      -- 2 is assigned to x                   
				};

	AssignedFun f x np  = mkText (mkS now_Adv (mkS (mkCl (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) valer_V2 np)));  

	Assert p   = mkText (mkPhr (lets_Utt ( mkVP assume_VS p ))) ;    --suposem que...

	Asserted p = mkText (mkClause [] True False (Ag Masc Sg P1) (mkVP assume_VS p)) ;
 
  	YesApprox n = mkText (mkText
        (mkPhr yes_Utt))
        (mkText
            (mkUtt
                (mkAdv with_Prep
                    (mkNP n (mkCN decimal_A place_N)) ))) ; 
{-
    EndBlock name = mkText
        (mkPhr (mkImp (mkVP (mkVP end_V)
            (mkAdv possess_Prep
                (mkNP the_Det (block_CN name)))))); 

    BegunBlock name = mkText
        (mkS now_Adv (mkS (mkClause [] True False (Ag Masc Pl P1)
				(mkVP begin_V2 (mkNP the_Det (block_CN name)))))); 

    EndedBlock name   = mkText
        (mkS now_Adv (mkS (mkClause [] True False (Ag Masc Pl P1) 
				(mkVP (mkVP end_V)
                    (mkAdv possess_Prep
                        (mkNP the_Det (block_CN name)))))));   			
-}															
} 

