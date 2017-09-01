--# -path=.:../finnic
instance DiffFin of DiffFinnic = open CommonFinnic, Prelude in {

param 

  NForm = NCase Number Case 
        | NComit | NInstruct  -- no number dist
        | NPossNom Number | NPossGen Number --- number needed for syntax of AdjCN
        | NPossTransl Number | NPossIllat Number 
        | NCompound ;  -- special compound form, e.g. "nais"

oper
  ncase : Number -> NPForm -> Det -> Case * NForm = \n,c,det ->
   let k = npform2case n c 
    in case <n, c, det.isNum, det.isPoss, det.isDef> of {
         <_, NPAcc,       True,_,_>  => <Nom,NCase Sg Part> ; -- myin kolme kytkintä(ni)
         <_, NPCase Nom | NPSep,  True,_,_>  => <Nom,NCase Sg Part> ; -- kolme kytkintä(ni) on
         <_, _, True,False,_>        => <k,  NCase Sg k> ;    -- kolmeksi kytkimeksi
         <Pl,NPAcc,     _, _, False> => <k,  NCase Pl Part> ; -- myin kytkimiä
         <_, NPAcc,     _,True,_>    => <k,  NPossNom n> ;    -- myin kytkime+ni
         <_, NPCase Nom | NPSep,_,True,_>  => <k,  NPossNom n> ;    -- kytkime+ni on/ovat...
         <_, NPCase Gen,_,True,_>    => <k,  NPossGen n> ;    -- kytkime+ni vika
         <_, NPCase Transl,_,True,_> => <k,  NPossTransl n> ; -- kytkim(e|i)kse+ni
         <_, NPCase Illat,_,True,_>  => <k,  NPossIllat n> ;  -- kytkim(ee|ii)+ni
 
         _                           => <k,  NCase n k>       -- kytkin, kytkimen,...
       } ;

param
  VForm = 
     Inf InfForm
   | Presn Number Person
   | Impf Number Person  --# notpresent
   | Condit Number Person  --# notpresent
   | Potent Number Person  --# notpresent
   | PotentNeg  --# notpresent
   | Imper Number
   | ImperP3 Number
   | ImperP1Pl
   | ImpNegPl
   | PassPresn  Bool 
   | PassImpf   Bool --# notpresent
   | PassCondit Bool --# notpresent
   | PassPotent Bool --# notpresent 
   | PassImper  Bool 
   | PastPartAct  AForm
   | PastPartPass AForm
   | PresPartAct  AForm
   | PresPartPass AForm
   | AgentPart    AForm
   ;

  InfForm =
     Inf1          -- puhua
   | Inf1Long      -- puhuakseni
   | Inf2Iness     -- puhuessa
   | Inf2Instr     -- puhuen
   | Inf2InessPass -- puhuttaessa
   | Inf3Iness     -- puhumassa
   | Inf3Elat      -- puhumasta
   | Inf3Illat     -- puhumaan
   | Inf3Adess     -- puhumalla
   | Inf3Abess     -- puhumatta
   | Inf3Instr     -- puhuman
   | Inf3InstrPass -- puhuttaman
   | Inf4Nom       -- puhuminen
   | Inf4Part      -- puhumista
   | Inf5          -- puhumaisillani
   | InfPresPart   -- puhuvan
   | InfPresPartAgr -- puhuva(mme)
   ;

}