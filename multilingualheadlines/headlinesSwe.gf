concrete headlinesSwe of headlines = {

flags coding = utf8 ;

lincat
    Headline = Str;
    PersNP = PersNPType;
    DocNP = {s : Str};
    ObjNP = {s : Str};
    PlaceNP = {s : PlaceNPCase => Str};
    GenTrV = VType;
    GoV = VType;
    OpenV = VType;
    PersV = VType;
    WriteV = VType;
    WithV = {s : Time => Str; rc : PersNPCase};
    ChgV = {s : Str};
    TimeAdv = {s : Str; t : Time};
    HiddenTime = {t : Time};
    PlaceAdv = {s : Str};

lin
    headlineGen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
    headlineGenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
    headlineGenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s ++ pa.s;
    headlineOpen p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s ! NomAcc_;
    headlineOpenTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s;
    headlineOpenTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s ++ pa.s;
    headlineChg v p = p.s ! NomAcc ++ v.s;
    headlineChgPlace v p pa = p.s ! NomAcc ++ v.s ++ pa.s;
    headlineWithTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s;
    headlineWithTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! v.rc ++ ta.s ++ pa.s;
    headlinePersTime p v p2 ta = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s;
    headlinePersTimePlace p v p2 ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ p2.s ! NomAcc ++ ta.s ++ pa.s;
    headlineGoTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s;
    headlineGoTimePlace p v o ta pa = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ! NomAcc_ ++ ta.s ++ pa.s;
    headlineWrite p v o h = p.s ! NomAcc ++ v.s ! h.t ++ o.s;
    headlineWriteTime p v o ta = p.s ! NomAcc ++ v.s ! ta.t ++ o.s ++ ta.s;
    King  = mkPersNP "kungen";
    President  = mkPersNP "statsministern";
    LeaderSP  = mkPersNP "socialistpartiests ledare";
    MinisterFA  = mkPersNP "utrikesministern";
    Judge  = mkPersNP "domaren";
    Singer  = mkPersNP "sångaren";
    Actor  = mkPersNP "skådespelaren";
    Inaugurate  = variants {mkV "inviga" "invigde" "invigt"; mkV "öppna" "öppnade" "öppnat"};
    Buy  = mkV "köpa" "köpte" "köpt";
    Die  = {s = variants {"har dött"; "har avlidit"}};
    Meet  = mkV "möta" "mötte" "mött" ** {rc = NomAcc};
    Talk  = mkV "tala" "talade" "talat" **{ rc = Comit};
    Support  = mkV "stödja" "stödde" "stött";
    Receive  = mkV "ta emot" "tog emot" "tagit emot";
    Criticize  = {s = table {
       Pas => "kritiserade";
       Pf => "har kritiserat";
       Fut => "kan komma att kritisera"
     };
 rc = NomAcc};
    Sign  = mkV "skriva på" "skrev på" "skrivit på";
    Attend  = mkV "delta i" "deltog i" "deltagit i";
    Exhibition  = {s = table {
       NomAcc_ => "utställningen";
       Dir => "till utställningen"
     }};
    Conference  = {s = table {
       NomAcc_ => "konferensen";
       Dir => "till konferensen"
     }};
    Car  = {s = "en bil"};
    House  = {s = "ett hus"};
    Agreement  = {s = "överenskommelsen"};
    ThisMorning  = {s = "i morse"; t = Pas};
    ThisEvening  = {s = "i kväll"; t = Fut};
    TodayBefore  = {s = "idag"; t = Pas};
    TodayAfter  = {s = "idag"; t = Fut};
    Tomorrow  = {s = "i morgon"; t = Fut};
    Yesterday  = {s = "igår"; t = Pas};
    NextWeek  = {s = "nästa vecka"; t = Fut};
    LastWeek  = {s = "förra veckan"; t = Pas};
    DayBeforeYest  = {s = "i förrgår"; t = Pas};
    DayAfterTom  = {s = "i övermorgon"; t = Fut};
    ThreeDaysAgo  = {s = "för tre dagar sedan"; t = Pas};
    InThreeDays  = {s = "om tre dagar"; t = Fut};
    AMomentAgo  = {s = "nyss"; t = Pas};
    MonBef  = {s = "i måndags"; t = Pas};
    TueBef  = {s = "i tisdags"; t = Pas};
    WedBef  = {s = "i onsdags"; t = Pas};
    ThuBef  = {s = "i torsdags"; t = Pas};
    FriBef  = {s = "i fredags"; t = Pas};
    SatBef  = {s = "i lördags"; t = Pas};
    SunBef  = {s = "i söndags"; t = Pas};
    MonAft  = {s = "på måndag"; t = Fut};
    TueAft  = {s = "på tisdag"; t = Fut};
    WedAft  = {s = "på onsdag"; t = Fut};
    ThuAft  = {s = "på torsdag"; t = Fut};
    FriAft  = {s = "på fredag"; t = Fut};
    SatAft  = {s = "på lördag"; t = Fut};
    SunAft  = {s = "på söndag"; t = Fut};
    HiddenPas  = {t = Pas};
    HiddenPf  = {t = Pf};
    HiddenFut  = {t = Fut};
    inMadrid  = {s = "i Madrid"};
    inBarcelona  = {s = "i Barcelona"};
    atHotel  = {s = "på ett hotel"};
    inCityCenter  = {s = "i centrum"};
    atNationalPalace  = {s = "på National Palace"};
    inFrance  = {s = "i Frankrike"};
    inChina  = {s = "i Kina"};
    inUS  = {s = "i USA"};

param
    Time = Pas | Pf | Fut;
    PersNPCase = NomAcc | Dat | Comit;
    PlaceNPCase = NomAcc_ | Dir;

oper
    PersNPType : Type  = {s : PersNPCase => Str};
    mkPersNP : Str -> PersNPType  = \w -> {s = table {
                NomAcc => w;
                Dat => "till" ++ w;
                Comit => "med" ++ w
              }};
    VType : Type  = {s : Time => Str};
    mkV : Str -> Str -> Str -> VType  = \inf,pas,pf -> {s = table {
                         Pas => pas;
                         Pf => "har"++pf;
                         Fut => "ska"++inf
                       }};

}
