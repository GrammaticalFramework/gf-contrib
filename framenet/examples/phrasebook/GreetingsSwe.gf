--# -coding=latin1
concrete GreetingsSwe of Greetings = SentencesSwe [Greeting,mkGreeting] ** open Prelude in {

lin
  GBye = mkGreeting "hej d�" ;
  GCheers = mkGreeting "sk�l" ;
  GDamn = mkGreeting "fan" ;
  GExcuse, GExcusePol = mkGreeting "urs�kta" ;
  GGoodDay = mkGreeting "god dag" ;
  GGoodEvening = mkGreeting "god afton" ;
  GGoodMorning = mkGreeting "god morgon" ;
  GGoodNight = mkGreeting "god natt" ;
  GGoodbye = mkGreeting "hej d�" ;
  GHello = mkGreeting "hej" ;
  GHelp = mkGreeting "hj�lp" ;
  GHowAreYou = mkGreeting "hur st�r det till" ;
  GLookOut = mkGreeting "se upp" ;
  GNiceToMeetYou, GNiceToMeetYouPol = mkGreeting "trevligt att tr�ffas" ;
  GPleaseGive, GPleaseGivePol = mkGreeting "var s� god" ;
  GSeeYouSoon = mkGreeting "vi ses snart" ;
  GSorry, GSorryPol = mkGreeting "f�rl�t" ;
  GThanks = mkGreeting "tack" ;
  GTheCheck = mkGreeting "notan" ;
  GCongratulations = mkGreeting "grattis";
  GHappyBirthday = mkGreeting "grattis p� f�delsedagen" ;
  GGoodLuck = mkGreeting "lycka till" ;

}
