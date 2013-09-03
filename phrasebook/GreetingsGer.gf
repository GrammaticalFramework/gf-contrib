--# -path=.:abstract:prelude:german:api:common
concrete GreetingsGer of Greetings = SentencesGer [Greeting,mkGreeting] ** open Prelude in {

lin 
  GBye = mkGreeting "tsch��" ;
  GCheers = mkGreeting "zum Wohl" ;
  GDamn = mkGreeting "verdammt" ;
  GExcuse, GExcusePol = mkGreeting "Entschuldigung" ;
  GGoodDay = mkGreeting "guten Tag" ;
  GGoodEvening = mkGreeting "guten Abend" ;
  GGoodMorning = mkGreeting "guten Morgen" ;
  GGoodNight = mkGreeting "gute Nacht" ;
  GGoodbye = mkGreeting "auf Wiedersehen" ;
  GHello = mkGreeting "Hallo" ;
  GHelp = mkGreeting "Hilfe" ;
  GHowAreYou = mkGreeting "wie geht's" ;
  GLookOut = mkGreeting "Achtung" ;
  GNiceToMeetYou = mkGreeting "nett, Sie zu treffen" ;
  GPleaseGive, GPleaseGivePol = mkGreeting "bitte" ;
  GSeeYouSoon = mkGreeting "bis bald" ;
  GSorry, GSorryPol = mkGreeting "Entschuldigung" ;
  GThanks = mkGreeting "Danke" ;
  GTheCheck = mkGreeting "die Rechnung" ;
  GCongratulations = mkGreeting "herzlichen Gl�ckwunsch";
  GHappyBirthday = mkGreeting "alles Gute zum Geburtstag" ;
  GGoodLuck = mkGreeting "viel Gl�ck" ; 

}

