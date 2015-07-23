module Upgrade where
import Editor
import Treebank
import System.Environment (getArgs)
import Data.List (group)
import Data.Map (lookup, fromList, Map)
import PGF (showExpr)
import Prelude hiding (lookup)
import Data.Algorithm.Diff
import System.Process


breakColon = break (==':')

	
performUpdate :: CSSelector -> String -> String -> Treebank -> IO Treebank
performUpdate sel author d tb = do
    let 
        TB (base,_) = tb
        cl = map cleanLine (lines d)
        tbm = fromTB tb
        Sel (lang,Just revision) = sel
        f = \(cnc,mcmt) -> CS author revision cnc mcmt
        tss = loop tbm lang f (zip [1..] cl) [] 
    putStrLn $ "Data has " ++ show (length cl) ++ " lines"
    putStrLn $ "Original treebank has " ++ show (length tss) ++ " entries"
    ts2 <- mapM (doUpgrade sel) (reverse tss)
    let newtb = TB (base,ts2)
    return $ tb +++ newtb

    
doUpgrade :: CSSelector -> (TreebankEntry,ChangeSet) -> IO TreebankEntry
doUpgrade sel (t,cs) = if (noDiffq dif)
                then return t
                else do
                    putStrLn $ showExpr [] (abst t)
                    doPrintDiff dif
                    updLoop 
    where
        cnc1 = case (lastcs t sel) of
                Just cs -> concrete cs
                Nothing -> error "No previous changeset to upgrade."
        cnc2 = concrete cs
        dif = getDiff (words cnc1) (words cnc2)
        Sel (lang,_) = sel
        updLoop = do
            putStrLn "Accept/Reject change?"
            cmd <- getLine
            case cmd of
                "a" -> return $ add t lang cs
                "r" -> return t
                _   -> updLoop



                                    

type NLines = [(Int,(String, Maybe String))]

upgrade :: TBMap -> ISOLang -> ((String,Maybe String) -> ChangeSet) -> State -> NLines -> (TreebankEntry,ChangeSet,NLines)
loop :: TBMap -> ISOLang -> ((String,Maybe String) -> ChangeSet) -> NLines -> [(TreebankEntry, ChangeSet)] -> [(TreebankEntry,ChangeSet)]

loop _ _ _ [] tcs = tcs
loop tbm lang ncs ls tcs =
    let
        (t,cs,ls') = upgrade tbm lang ncs Blank ls
    in loop tbm lang ncs ls' ((t,cs):tcs)




data State = Abstract TreebankEntry | Blank
  deriving Show


cleanLine line = (cnc,mcmt)
  where (cnc',cmt) = break (=="--") (group line)
        cnc = unwords . words . concat $ cnc'
        mcmt = case cmt of
                []       -> Nothing
                "--":s   -> Just (concat s) 

upgrade tbm lang ncs st ((_,(l,Nothing)):ls) | null l =
	upgrade tbm lang ncs st ls
upgrade tbm lang ncs Blank ((n,(l,Nothing)):ls) =
	upgrade tbm lang ncs newst ls
 where (rev,(':':exp)) = breakColon l
       (e,Nothing) = cleanLine exp
       newst = case (lookup e tbm) of
            Just tbe -> (Abstract tbe)
            Nothing  -> error $ "Not in abstract at line " ++ (show n)
upgrade tbm lang ncs (Abstract tbe) ((_,(l,mcmt)):ls) = (tbe,clcmt,ls)
  where 
        clcmt = ncs (l,mcmt)

        

diffRecent lang t = getDiff cnc1 cnc2
  where cs1:cs2:_ = sortCs t lang
        cnc1 = words $ concrete cs1
        cnc2 = words $ concrete cs2