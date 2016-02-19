concrete CountriesEng of Countries = RelQueryEng ** {

-- to be generated from a DB schema

lin
  TICountry = mkTableIdent "country" ;
  TICurrency = mkTableIdent "currency" ;

  AIName = mkAttributeIdent "name" ;
  AICapital = mkAttributeIdent "capital" ;
  AICurrency = mkAttributeIdent "currency" ;
  AIPopulation = mkAttributeIdent "population" ;
  AIArea = mkAttributeIdent "area" ;

  ISweden = mkIndividual "Sweden" ;
  IStockholm = mkIndividual "Stockholm" ;
  IEuro = mkIndividual "Euro" ;

}