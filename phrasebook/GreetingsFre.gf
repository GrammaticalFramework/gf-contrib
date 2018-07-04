--# -coding=latin1
concrete GreetingsFre of Greetings = SentencesFre [Greeting,mkGreeting] ** open Prelude in {

lin 
  GBye = mkGreeting "au revoir" ;
  GCheers = mkGreeting "sant�" ;
  GDamn = mkGreeting "maudit" ;
  GExcuse = mkGreeting "excuse-moi" ;
  GExcusePol = mkGreeting "excusez-moi" ;
  GGoodDay = mkGreeting "bonjour" ;
  GGoodEvening = mkGreeting "bon soir" ;
  GGoodMorning = mkGreeting "bonjour" ;
  GGoodNight = mkGreeting "bonne nuit" ;
  GGoodbye = mkGreeting "au revoir" ;
  GHello = mkGreeting "salut" ;
  GHelp = mkGreeting "au secours" ;
  GHowAreYou = mkGreeting "comment �a va" ;
  GLookOut = mkGreeting "attention" ;
  GNiceToMeetYou = mkGreeting "enchant�" ;
  GPleaseGive = mkGreeting "s'il te pla�t" ;
  GPleaseGivePol = mkGreeting "s'il vous pla�t" ;
  GSeeYouSoon = mkGreeting "� bient�t" ;
  GSorry, GSorryPol = mkGreeting "pardon" ;
  GThanks = mkGreeting "merci" ;
  GTheCheck = mkGreeting "l'addition" ;
  GCongratulations = mkGreeting "f�licitations";
  GHappyBirthday = mkGreeting "joyeux anniversaire" ;
  GGoodLuck = mkGreeting "bonne chance" ; 
  GWhatTime = mkGreeting "quelle heure est-il" ;

}
