concrete HelloFin of Hello = {

  lincat Greeting, Recipient = {s : Str} ;

  lin 
    Hello rec = {s = "terve" ++ rec.s} ;
    World = {s = "maailma"} ;
    Mum = {s = "�iti"} ;
    Friends = {s = "yst�v�t"} ;
}