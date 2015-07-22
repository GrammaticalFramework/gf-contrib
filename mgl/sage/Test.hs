module Test where
import Text.Parsec.String
import Text.Parsec.Char
import Text.Parsec.Combinator
import Text.Parsec.Prim 



type QA = (String, String,String)
type Language = String
data Dialog = Dlg (Maybe Language) [QA]
	deriving Show

parseSamples :: FilePath -> IO [Dialog]
parseSamples path = do
	content <- readFile path
	case parse (many dialog) [] content of
		Left err -> error $  "parse error at " ++ show err
		Right dl -> return dl
  where
	line   :: Parser String
	triple :: Parser QA
	dialog :: Parser Dialog
	triple = do
			l1 <- line1
			l2 <- line1
			l3 <- line1
			return (l1,l2,l3)
	  where
	  	line1 = line >>= (\l -> newline >> return l)
	line = many $ noneOf "\n"
	dialog = do 
		string "BEGIN"
		mlang <- optionMaybe (skipMany (char ' ') >> many1 letter)
		newline
		ts <- manyTill triple  (string "END\n")
		-- skipMany newline
		return $ Dlg mlang ts


showDialog :: Int -> Dialog -> String
showDialog k (Dlg _ ((s,_,_):_)) = "Dialog '" ++ take k s ++ " ...'" 