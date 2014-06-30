--# -path=.:present:../../lib
-- FrameNet API: ../../lib

concrete PhrasebookEng of Phrasebook =
  GreetingsEng,
  WordsEng ** open
    SyntaxEng,
    Prelude in {

flags
  language = en_US ;

}
