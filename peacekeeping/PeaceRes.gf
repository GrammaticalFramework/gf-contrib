resource PeaceRes = {

  param Punct = FullStop | QuestMark | ExclMark ;

  param SForm = SPos | SNeg | SQuest ;

  oper
    stop, quest, excl : Str -> { s : Str; p : Punct } ;
    stop x = { s = x; p = FullStop } ;
    quest x = { s = x; p = QuestMark } ;
    excl x = { s = x; p = ExclMark } ;

}