module Defect where
import Treebank
import Text.JSON.Pretty (pp_value, render)
import Text.JSON
import Data.List (nub)
import Data.Char (isDigit)
import Data.Map (insertWith, Map, empty, lookup, fromList)
import System.Console.Haskeline


type EntryMap = Map (Int,CSSelector) Defect
type TTag = String
 
data Defect = Def Int CSSelector Status [TTag]
 deriving Show
 
 
mkNew, mkUntrack :: Int -> CSSelector -> Defect
mkNew j sel     = Def j sel Sunassigned []
mkUntrack j sel = Def j sel Suntracked []


type Assignee = Int

data Status
	= Sunassigned
	| Sassigned Assignee
	| Suntracked
	| Swontfix String
	| Scompleted
  deriving (Show, Eq, Ord)
	
instance JSON Status where
	showJSON Sunassigned = showJSON "O"
	showJSON (Sassigned u) = showJSON $ 'A':(show u)
	showJSON Suntracked = showJSON "U"
	showJSON (Swontfix reason) = showJSON $ '!':reason
	showJSON Scompleted = showJSON "."
	
	readJSON (JSString val) = case fromJSString val of
		"O"	    -> Ok Sunassigned
		'A':cs  -> Ok $ Sassigned (read cs)
		"U"     -> Ok Suntracked
		'!':cs  -> Ok $ Swontfix cs
		"."     -> Ok $ Scompleted
		_       -> Error "Cannot decode Status"
	
	
instance JSON Defect where
    showJSON (Def n sel stat tgs) = makeObj [("tbentry", jnum), ("selector", jsel),("status", jstat), ("tags", jtgs)]
        where
            jnum = showJSON n
            jsel = showJSON sel
            jstat = showJSON stat
            jtgs = showJSONs tgs

    readJSON (JSObject job) = 
        case (val "tbentry", val "selector") of
            (Ok jnum,Ok jsel) ->
                    case (val "status",val "tags") of
                        (Ok jstat,Ok jtags) ->
                            let Ok num = readJSON jnum
                                Ok stat = readJSON jstat
                                Ok tags = readJSON jtags
                                Ok sel = readJSON jsel
                            in Ok $ Def num sel stat tags
                        _ -> Error $ "Cannot decode defect"
            _                 -> Error $ "Cannot decode defect"
      where
        val k = valFromObj k job
			
			
saveEntryStatus :: [Defect] -> FilePath -> IO ()
saveEntryStatus ess path =
	(writeFile path) . render . pp_value . showJSON $ ess
	
retrieveEntryStatus :: FilePath -> IO [Defect]
retrieveEntryStatus path =do
	contents <- readFile path
	case (decode contents) of
		Ok tb   -> return tb
		Error e -> error e

	
emptyStatus :: EntryMap
emptyStatus = empty

findStatus :: EntryMap -> Int -> CSSelector -> Maybe Defect
findStatus mp j sel = Data.Map.lookup (j,sel) mp


-- Input/Output

readES :: FilePath -> IO [Defect]
readES path = do
    Ok tsts <- readFile path >>= return . decode :: IO (Result [Defect])
    return tsts

saveES :: FilePath -> [Defect] -> IO ()
saveES path tsts = writeFile path (encode tsts)

testlangs = words "spa eng ger pol"

            
editTags :: Defect -> IO Defect
editTags df@(Def n sel st tgs) = do
    ms <- runInputT defaultSettings loop
    return $
        case ms of
            Just s -> Def n sel st (words s)
            _      -> df
  where
    loop = getInputLineWithInitial "tags> " (unwords tgs, "")


mkMap :: [Defect] -> EntryMap
mkMap tsts = fromList [((n,s),ts) | ts@(Def n s _ _) <- tsts]
        

(+:+) :: Defect -> Defect -> Defect
(Def na sela sa tsa) +:+ (Def nb selb sb tsb) | na == nb && sela == selb = Def na sela (min sa sb) (nub $ tsa ++ tsb)
                                              | otherwise = error $ "Not equal: " ++ show na ++ show nb
    
    
