--# -path=.:RGLExt:alltenses:../../lib/src/english

concrete ExtensionEng of Extension = CatEng ** open MorphoEng, ResEng, ConjunctionEng, StructuralEng, Prelude, ParadigmsEng, Coordination, ParamBasic in {


lincat 
    PolSentence = {s : SentForm => CPolarity => Str ; flag : Flag};
    [CN] = {s1,s2 : Number => ResEng.Case => Str ; g : Gender} ;   
    StmtS = {s : Str};

lin 
VerbToNounV2 vs = VerbToNoun vs ** {c2 = vs.c2; lock_N2=<>};

VerbToNoun v = {s = \\_,_ => v.s ! VPresPart;
                g = Masc; lock_N=<>};
                                
VerbToGerundA v = {s = \\_ => v.s ! VPresPart; lock_A=<>};              

VerbToParticipeA v = {s = \\_ => v.s ! VPPart; lock_A=<>};

mkPolSent cl = {s = \\f,b => case b of 
                              {CPos => cl.s ! Pres ! Simul ! CPos ! ODir;
                               _   => cl.s ! Pres ! Simul ! CNeg False ! ODir};
                flag = NothingS ;
                lock_PolSentence = <>};
               
getSent psel = {s = psel.s ! Indep ! CPos} ;

sentToNoun ps = {s = \\_ => "\"" ++ ps.s ! Indep ! CPos ++ "\"";
                 a = agrP3 Sg; lock_NP=<>};               
               
ConjCN conj ss = conjunctDistrTable2 Number ResEng.Case conj ss ** {g = ss.g;lock_CN=<>};               

BaseCN x y ={s1 = \\n,c => x.s ! n ! c ;
             s2 = \\n,c => y.s ! n ! c ;   
             g  =  x.g} ;  

ConsCN xs x = consrTable2 Number ResEng.Case comma xs x ** {g = Masc} ;               


UsePolSentence p ps = {s = ps.s ! Indep ! p.p};

at_Prep = mkPrep "at" ;
per_Prep = mkPrep "per" ;  

O1 = {s = \\_ => "o1" ;
      a = agrP3 Sg}**{lock_NP=<>};

O2 = {s = \\_ => "o2" ;
      a = agrP3 Sg}**{lock_NP=<>};

O3 = {s = \\_ => "o3" ;
      a = agrP3 Sg}**{lock_NP=<>};
      
O4 = {s = \\_ => "o4" ;
      a = agrP3 Sg}**{lock_NP=<>};      
      
O5 = {s = \\_ => "o5" ;
      a = agrP3 Sg}**{lock_NP=<>};      

     
} 
