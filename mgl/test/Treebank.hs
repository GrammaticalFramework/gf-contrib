module Treebank where
import Prelude hiding (lookup)
import Data.Char (toUpper)
import Text.Regex
import Text.JSON
import Text.JSON.Pretty (pp_value, render)
import Data.List (sortBy, groupBy, nub)
import Data.Map (lookup, fromList, toList, Map, keys, insertWith, (!), elems, unionWith)
import Data.Maybe (fromMaybe, isJust)
import Data.Ord (comparing)
import PGF

import Debug.Trace (traceShow, trace)

mtrace t = traceShow t t


type ISOLang = String
newtype CSSelector = Sel (ISOLang, Maybe Int)
	deriving Eq

instance Show CSSelector where
    show (Sel (l, Nothing)) = show l
    show (Sel (l, Just rev)) = (show l) ++ " at rev <= " ++ (show rev)
	
	
instance Ord CSSelector where
	compare (Sel (la,ra)) (Sel (lb,rb)) =
		case compare la lb of
			EQ -> case (ra,rb) of
					(Nothing,Nothing) -> EQ
					(Just a, Just b)  -> compare a b
					(Nothing, _)      -> GT
					(_,Nothing)       -> LT
			o  -> o 
	
instance JSON CSSelector where
	showJSON (Sel (lang,mrev)) = makeObj [("lang",jlang), ("revision",jrev)]
	  where
		jlang = showJSON lang
		jrev = showJSON mrev
		
	readJSON (JSObject jsel) =
		case (val "lang",val "revision") of
			(Ok lang,Ok mrev) -> Ok $ Sel (lang,mrev)
			_                 -> Error "Cannot decode selector"
	  where val k = valFromObj k jsel
			
    

type Lang = CId
newtype Treebank = TB (FilePath, [TreebankEntry])
type TBMap = Map String TreebankEntry

fromTB :: Treebank -> TBMap
baseTB :: Treebank -> String
baseTB (TB (base,_)) = base
fromTB (TB (_,ts)) = 
	fromList [(showExpr [] (abst t),t) | t <- ts]
	
	
shAbs :: TreebankEntry -> String
shAbs = (showExpr []) . abst


(+++) :: Treebank -> Treebank -> Treebank
tb1 +++ tb2  =
	if baseTB tb1 == baseTB tb2
		then TB (base,elems tm)
		else error "Not the same base."
  where
       base = baseTB tb1
       tm1 = fromTB tb1
       tm2 = fromTB tb2
       tm = unionWith updateTBE tm1 tm2
	
	
updateTBE :: TreebankEntry -> TreebankEntry -> TreebankEntry
updateTBE (T t1 m1) (T t2 m2) | t1 == t2 = T t1 m where
	m = unionWith updateCS m1 m2

updateCS :: [ChangeSet] -> [ChangeSet] -> [ChangeSet]
updateCS cs1 cs2 = nub (cs1 ++ cs2)
	
type Linearizer = Tree -> ISOLang -> String

data TreebankEntry = T Tree (Map ISOLang [ChangeSet]) 

data ChangeSet = CS {
        author :: String,
        revision :: Int,
        concrete :: String,
		comment :: Maybe String
    } deriving (Show, Eq)

    
    
groupByField :: Eq b => (a -> b) -> [a] -> [[a]]
groupByField f = groupBy cmp where
    cmp x y = f x == f y



abst :: TreebankEntry -> Tree
changesets :: TreebankEntry -> CSSelector -> [ChangeSet]
langs :: TreebankEntry -> [ISOLang]
revs  :: TreebankEntry -> [Int]
current :: [ChangeSet] -> ChangeSet
lastcs :: TreebankEntry -> CSSelector -> Maybe ChangeSet
add :: TreebankEntry -> ISOLang -> ChangeSet -> TreebankEntry

-- Searching in Treebanks

findIdExpr, matchIdExpr ::  Maybe Int -> String -> TreebankEntry -> Bool


purge :: TreebankEntry -> TreebankEntry
sortCs :: TreebankEntry -> ISOLang -> [ChangeSet]

abst (T t _)  = t

changesets (T _ cs) (Sel (lang, Nothing))   = fromMaybe [] (lookup lang cs)
changesets (T _ cs) (Sel (lang, Just rev))  = filter ((<=rev) . revision) $ fromMaybe [] (lookup lang cs)


langs (T _ cs) = keys cs
revs (T _ cs)  = nub . map revision . concat . elems $ cs
current css = head $ reverse $ sortBy (comparing revision) css


sortCs (T _ m) lang = reverse $ sortBy (comparing revision) css
  where css = m ! lang

lastcs tbe sel =
    case (changesets tbe sel) of
        []  -> Nothing
        css -> Just $ current css
    

add (T t m) lang cs = T t m1 where
    m1 = insertWith (++) lang [cs] m

purge (T t m) = T t m1 where
    m1 = fromList [(l,pg cs) | (l,cs) <- toList m]
    pg cs = map head $ groupByField revision cs
    

findIdExpr mn s tbe = hasExpr (==(mkCId s)) tbe mn
matchIdExpr mn s tbe = hasExpr match tbe mn
  where re = mkRegex s
        match t = isJust $ matchRegex re (show t)

hasExpr p t Nothing = hasExpr p t (Just 8)
hasExpr p (T t _) (Just n) = findIdExp p n t
  where
    findIdExp _ n _ | n < 0 = False
    findIdExp p n exp =
        case unApp exp of
            Just (f, es) -> p f || (or $ map (findIdExp p (n-1)) es)
            Nothing      -> False

-- JSON interface

instance Show TreebankEntry where
    show tb@(T a css) = sa ++ " with cnc: " ++ ls where
        sa = showExpr [] a
        ls = unwords $ langs tb

instance JSON TreebankEntry where
    showJSON (T t css) = makeObj (("tree", jt):jcss) where
        jt = JSString $ toJSString $ showExpr [] t
        jcss = [(l,showJSONs cs) | (l,cs) <- toList css ]    
    
    readJSON (JSObject job) = 
        case (valFromObj "tree" job) of
            Ok jtree -> let
                            m = fromList [(l,css) | (l, jcss) <- fromJSObject job, let Ok css = readJSONs jcss, l /= "tree"]
                            Just tree = readExpr $ fromJSString jtree
                       in Ok (T tree m)
            Error e -> Error e


myTrace t = traceShow t t 

instance JSON ChangeSet where
    showJSON (CS a r cnc cmt) =
        makeObj (case cmt of
            Just s  -> ("comment",showJSON s):base
            Nothing -> base)
        where
            base = [("source",ja), ("rev",jr), ("cnc",jcnc)]
            ja = showJSON a
            jr = showJSON r
            jcnc = showJSON cnc

    readJSON (JSObject jcs) = let
            m = fromList $ fromJSObject jcs
            extract k = lookup k m
        in case extract "source" of
                Just (JSString c) -> let author = fromJSString c
                          in case extract "rev" of
                            Just n -> let Ok revision = readJSON n
                                      in case extract "cnc" of
                                        Just (JSString cnc) -> let concrete = fromJSString cnc
                                                    in case extract "comment" of
                                                        Just (JSString cmt) -> let comment = fromJSString cmt
                                                                               in Ok (CS author revision concrete (Just comment))
                                                        Nothing             -> Ok (CS author revision concrete Nothing)
                                        _        -> Error "No concrete"
                            _      -> Error "No revision" 
                _      -> Error "No committer"
        
csToJS :: ChangeSet -> JSValue
csToJS = showJSON
                    

instance JSON Treebank where
    readJSON (JSObject jtb) = let
			m = fromList $ fromJSObject jtb
		in case (lookup "grammar" m) of
			Just jbase -> case (readJSON jbase) of
							Ok base -> case (lookup "entries" m) of
											Just jts -> case (readJSONs jts) of			
															Ok ts   -> Ok $ TB (base,ts)
															Error e -> Error e
											Nothing  -> Error "No entries"
							Error e -> Error e
			Nothing    -> Error "No grammar" 

    showJSON (TB (base,tbs)) = makeObj [("grammar",pgf), ("entries",entries)]
        where 
			pgf = showJSON base
			entries = showJSONs tbs
    

-- Utilities        

readTB :: FilePath -> IO Treebank
readTB path = do
    contents <- readFile path
    case (decode contents) of
        Ok tb   -> return tb
        Error e -> error e

saveTB, savePrettyTB :: Treebank -> FilePath -> IO ()
saveTB tb path = writeFile path (encode tb)
savePrettyTB tb path = writeFile path (pp_treebank tb)


-- Prettyprinting JSON Treebanks

theMain :: IO ()
theMain = do
    tb <- readTB "eng.json"
    savePrettyTB tb "foo-pp.json"

pp_treebank :: Treebank -> String
pp_treebank tb = render $ pp_value (showJSON tb)
-- pp_newtreebank tb = render $ pp_value (showJSON tb)


-- Printing

showAbs :: TreebankEntry -> String
showCurrent :: ISOLang -> TreebankEntry -> String
showCS :: ChangeSet -> String


showAbs (T t _) = showExpr [] t
showCurrent lang tbe =
    case lastcs tbe sel of
        Just cs -> map toUpper lang ++ " " ++ showCS cs
        _       -> []
  where sel = Sel (lang,Nothing) 
showCS cs = author cs ++ "/" ++ rev ++ ":\n " ++ cnc ++ remark
  where rev = show $ revision cs
        cnc = "\"" ++ concrete cs ++ "\""
        remark = case (comment cs) of
                    Just cm -> "\n/*" ++ cm ++ "*/"
                    _      -> "\n"


-- Depth and breadth of Expressions
depth, breadth :: Expr -> Int

depth e = case (unApp e) of
        Just (f, []) -> 0 
        Just (f,es)  -> maximum (map depth es) + 1
        Nothing      -> 0 -- error $ "cannot unapply " ++ (showExpr [] e)

breadth e = case (unApp e) of
        Just (f,[])  -> 1
        Just (f, es) -> sum (map breadth es)
        Nothing      -> 1 -- error $ "cannot unapply " ++ (showExpr [] e)
