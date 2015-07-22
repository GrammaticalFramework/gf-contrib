module Update where
import Treebank
import Text.ParserCombinators.Parsec
--import Main (loadTreebank, Context(..), getSvnInfo)
import Data.Map (keys, lookup, fromList, (!))
import Data.Algorithm.Diff
import Editor

-- Revision Abstract Concrete Comment
type Revision = Int
type Concrete = String
type Abstract = String
data RConcrete = NL Revision Abstract Concrete (Maybe String)
  deriving Show

abstract :: GenParser Char st (Revision, Abstract)
concret :: String -> GenParser Char st (Concrete, Maybe String)
entry :: GenParser Char st RConcrete
rConcFile :: GenParser Char st [RConcrete]

rConcFile = do
	result <- many entry
	eof
	return result
	
eol = char '\n'

entry = do
	(rev,abst) <- abstract
	(cnc, mcomment)  <- concret []
	return $ NL rev abst cnc mcomment
	
abstract = do
	rev <- many (noneOf ":")
	abst <- char ':' >> many (char ' ') >> many (noneOf "\n")
	eol
	return (read rev, abst)
	
concret s = 
		try (noDash s) <|> withDash s
		
noDash s = do
		c <- many (noneOf "-\n")
		eol
		return (s ++ c, Nothing)

withDash s = do
		c <- many (noneOf "-")
		try (justComment (s ++ c)) <|> (char '-' >> concret (s ++ c ++"-"))

justComment s = do
		char '-' >> char '-'
		com <- many (noneOf "\n")
		eol
		return (s, Just com)

parseConcretes :: FilePath -> IO (Either ParseError [RConcrete])
parseConcretes path = do
    content <- readFile path
    return $ parse rConcFile path content


-- Diffs
---



addCncTBE :: String -> CSSelector -> RConcrete -> TreebankEntry -> IO TreebankEntry
addCncTBE author sel (NL rev2 ab cnc2 mcom) tbe | noDiffq dif = return tbe
                       | otherwise =
	if rev1 > rev2
		then error $ "New entry has revision " ++ show rev2 ++ " while old has " ++ show rev1
		else do
				putStrLn ab
				doPrintDiff dif
				loop
  where
	Sel (lang,Just rev0) = sel
	cs1 = maybe npc id $ lastcs tbe $ Sel (lang, Nothing)
	rev1 = revision cs1
	cnc1 = concrete cs1
	npc = error "No previous changeset to upgrade." 
	dif = getDiff (words cnc1) (words cnc2)
	cs2 = CS author rev0 cnc2 mcom
	tbe2 = T (abst tbe) $ fromList [(lang,[cs2])]
	loop = do
		putStr "Accept/Reject change? "
		cmd <- getChar
		case cmd of
			'a' -> return $ updateTBE tbe tbe2
			'r' -> return tbe
			_   -> loop


{-	
fuse = do
	svni <- getSvnInfo
	g1 <- readFile "ger.txt"
	g2 <- readFile "ger2.txt"
	b <- loadTreebank lang "treebank.json"
	let Right rc1 = parseConcretes g1
	    Right rc2 = parseConcretes g2
	    rev = read (svni!"Revision")
	    sel = Sel (lang, Just rev)
	    tbm = fromTB (tb b)
	    m1 = [(a,nl) | nl@(NL r1 a _ _) <- rc1]
	putStrLn $ show $  all (\(NL r2 a _ _) -> let Just (NL r1 _ _ _) = Prelude.lookup a m1 in r2<=r1) rc2
	ntb <- mapM (upd sel tbm m1) rc2
	return (b,ntb)
  where
		lang = "ger"
		upd sel m m1 r@(NL rv ab c mc) = addCncTBE "maike" sel r2 (m!ab)
		  where
			Just (NL rv1 _ _ _) = Prelude.lookup ab m1
			r2 = NL rv1 ab c mc
-}