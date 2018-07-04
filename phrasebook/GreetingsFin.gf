--# -coding=latin1
concrete GreetingsFin of Greetings = SentencesFin [Greeting,mkGreeting] ** open Prelude in {

lin 
  GBye = mkGreeting "hei hei" ;
  GCheers = mkGreeting "terveydeksi" ;
  GDamn = mkGreeting "hitto" ;
  GExcuse, GExcusePol = mkGreeting "anteeksi" ;
  GGoodDay = mkGreeting "hyv�� p�iv��" ;
  GGoodEvening = mkGreeting "hyv�� iltaa" ;
  GGoodMorning = mkGreeting "hyv�� huomenta" ;
  GGoodNight = mkGreeting "hyv�� y�t�" ;
  GGoodbye = mkGreeting "n�kemiin" ;
  GHello = mkGreeting "hei" ;
  GHelp = mkGreeting "apua" ;
  GHowAreYou = mkGreeting "mit� kuuluu" ;
  GLookOut = mkGreeting "varo" ;
  GNiceToMeetYou = mkGreeting "hauska tutustua" ;
  GPleaseGive = mkGreeting "ole hyv�" ;
  GPleaseGivePol = mkGreeting "olkaa hyv�" ;
  GSeeYouSoon = mkGreeting "n�hd��n pian" ;
  GSorry, GSorryPol = mkGreeting "anteeksi" ;
  GThanks = mkGreeting "kiitos" ;
  GTheCheck = mkGreeting "lasku" ;
  GCongratulations = mkGreeting "onnittelut";
  GHappyBirthday = mkGreeting "hyv�� syntym�p�iv��" ;
  GGoodLuck = mkGreeting "onnea" ; 
  GWhatTime = mkGreeting "paljonko kello on" | mkGreeting "mit� kello on" ;

}
