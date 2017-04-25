incomplete concrete MiniGrammarFunctor of MiniGrammar =
  open
    Grammar
  in {
lincat
   Utt = Grammar.Utt ;
   Adv = Grammar.Adv ;
   Pol = Grammar.Pol ;
   S = Grammar.S ;
   Cl = Grammar.Cl ;
   VP = Grammar.VP ;
   AP = Grammar.AP ;
   CN = Grammar.CN ;
   NP = Grammar.NP ;
   Pron = Grammar.Pron ;
   Det = Grammar.Det ;
   Conj = Grammar.Conj ;
   Prep = Grammar.Prep ;
   V = Grammar.V ;
   V2 = Grammar.V2 ;
   A = Grammar.A ;
   N = Grammar.N ;
   PN = Grammar.PN ;

lin
   DetCN = Grammar.DetCN ;
   UsePN = Grammar.UsePN ;
   UsePron = Grammar.UsePron ;
   MassNP = Grammar.MassNP ;
   a_Det = Grammar.DetQuant IndefArt NumSg ;
   aPl_Det = Grammar.DetQuant IndefArt NumPl ;
   the_Det = Grammar.DetQuant DefArt NumSg ;
   thePl_Det = Grammar.DetQuant DefArt NumPl ;
   UseN = Grammar.UseN ;
   AdjCN = Grammar.AdjCN ;
   PositA = Grammar.PositA ;
   PrepNP = Grammar.PrepNP ;
   UseV = Grammar.UseV ;
   ComplV2 v = Grammar.ComplSlash (SlashV2a v) ;
   UseAP ap = Grammar.UseComp (CompAP ap) ;
   AdvVP = Grammar.AdvVP ;
   PredVP = Grammar.PredVP ;
   UsePresCl pol cl = Grammar.UseCl (TTAnt TPres ASimul) pol cl ;
   UttS = Grammar.UttS ;
   UttNP = Grammar.UttNP ;
   CoordS conj x y = Grammar.ConjS conj (BaseS x y) ;
   PPos = Grammar.PPos ;
   PNeg = Grammar.PNeg ;
   and_Conj = Grammar.and_Conj ;
   or_Conj = Grammar.or_Conj ;
   every_Det = Grammar.every_Det ;
   in_Prep = Grammar.in_Prep ;
   on_Prep = Grammar.on_Prep ;
   with_Prep = Grammar.with_Prep ;
   i_Pron = Grammar.i_Pron ;
   youSg_Pron = Grammar.youSg_Pron ;
   he_Pron = Grammar.he_Pron ;
   she_Pron = Grammar.she_Pron ;
   we_Pron = Grammar.we_Pron ;
   youPl_Pron = Grammar.youPl_Pron ;
   they_Pron = Grammar.they_Pron ;
}
