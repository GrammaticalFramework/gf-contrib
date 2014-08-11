--# -path=.:present:../../lib
-- FrameNet API: ../../lib

concrete PhrasebookSwe of Phrasebook =
  GreetingsSwe,
  WordsSwe ** open
    SyntaxSwe,
    Prelude in {
flags
  language = sv_SE ;

}
