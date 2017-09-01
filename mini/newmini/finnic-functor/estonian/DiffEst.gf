instance DiffEst of DiffFinnic = open CommonFinnic, Prelude in {


-------
-- Noun

param
  NForm = NCase Number Case ; 

oper
  ncase : Number -> NPForm -> Det -> Case * NForm = \n,c,det ->
   let k = npform2case n c 
    in case <n, c, det.isNum, det.isDef> of {
         <_, NPAcc,               True,_>  => <Nom,NCase Sg Part> ; -- myin kolme kytkintä
         <_, NPCase Nom | NPSep,  True,_>  => <Nom,NCase Sg Part> ; -- kolme kytkintä on
         <_, _,                   True,_>  => <k,  NCase Sg k> ;    -- kolmeksi kytkimeksi
         <Pl,NPAcc,           _,   False>  => <k,  NCase Pl Part> ; -- myin kytkimiä

         _                           => <k,  NCase n k>       -- kytkin, kytkimen,...
       } ;

-------
-- Verb

param
  VForm = 
     Inf InfForm
   | Presn Number Person
   | Impf Number Person  --# notpresent
   | Condit Number Person  --# notpresent
--   | Potent Number Person  --# notpresent
--   | PotentNeg  --# notpresent
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
   | QuotativeAct -- Only Estonian
   | QuotativePass -- Only Estonian
--   | AgentPart    AForm
   ;

  InfForm =
     InfDa        -- lugeda
   | InfDes       -- lugedes
   | InfMa        -- lugema
   | InfMine      -- lugemine
   ;



}