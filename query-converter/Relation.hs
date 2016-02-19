module Relation where

import qualified Data.Map as M
import Data.List

data Table = Table {
  tname   :: Maybe Id,    -- name, if any ; not fully used   
  tdata   :: [Tuple],     -- unlabelled tuples, should be all of the same length; a bag
  tindex  :: LabelMap,    -- labels and their types in order 0,1,2,...
  tlabels :: [Id]         -- list of labels, which can have duplicates
  }
 deriving Show

initTable :: Table
initTable = Table Nothing [] M.empty []

type Id = String

qualify :: Id -> Id -> Id
qualify q c = if null q then c else (q ++ "." ++ c)

unqualify :: Id -> (Id,Id)
unqualify qc = case break (=='.') qc of
  (q,_:c) -> (q,c)
  _ -> ("",qc)

type Tuple = [Value]
type LabelMap = M.Map Id (Int,Type)

data Value = VString String | VInt Integer | VFloat Double | VNull | VError String
  deriving (Eq,Ord,Show)

data Type = TString | TInt | TFloat
  deriving (Eq,Ord,Show)

lookLabel :: LabelMap -> Id -> (Int,Type)
lookLabel m l = case M.lookup l m of
  Just it -> it
  _ -> error $ "unknown label " ++ l

lookLabelPosition :: LabelMap -> Id -> Int
lookLabelPosition m = fst . lookLabel m

lookTupleValue :: LabelMap -> Tuple -> Id -> Value
lookTupleValue m t l = t !! lookLabelPosition m l

value :: Table -> Tuple -> Id -> Value
value ts t x = case filter (==x) (tlabels ts) of
  [_] -> lookTupleValue (tindex ts) t x
  []  -> VError $ "unknown attribute " ++ x
  _   -> VError $ "ambiguous attribute " ++ x

-- the real attributes, without the duplicates in tlabels
attributes :: Table -> [Id]
attributes t = map snd $ sort [(i,a) |  (a,(i,_)) <- M.assocs (tindex t)]

prTable :: Table -> String
prTable t = unlines $
  [prRow (tlabels t)] ++
  [prRow (map prValue r) | r <- tdata t]

prRow :: [String] -> String
prRow ss = concat $ "| " : intersperse "\t| " ss ++ ["\t|"]

prValue :: Value -> String
prValue v = case v of
  VString s -> "'" ++ s ++ "'"
  VInt i -> show i
  VFloat i -> show i
  VNull  -> "NULL"
  VError s -> "ERROR " ++ s

prType :: Type -> String
prType ty = case ty of
  TInt -> "INT"
  TFloat -> "FLOAT"
  TString -> "TEXT" 

-- verify that label maps have the same labels with the same types; positions can differ
isSameType :: Table -> Table -> Bool
isSameType t u = 
  length tl == length ul
  && and [a == b && x == y | ((a,(_,x)),(b,(_,y))) <- zip tl ul] 
 where
   tl = M.assocs (tindex t) -- sorted by label
   ul = M.assocs (tindex u) -- sorted by label

changeOrder :: LabelMap -> Table -> Table
changeOrder lm t = project ls t 
  where
   ls = map snd $ sort [(i,l) | (l,(i,_)) <- M.assocs lm]

ifSameType :: (Table -> Table -> Table) -> Table -> Table -> Table
ifSameType op t u = if isSameType t u then op t u else error "tables not of the same type"


-- relation algebra operations

project :: [Id] -> Table -> Table
project ls t = t {
  tdata = [[r !! i | (i,_) <- ps] | r <- tdata t],
  tindex = M.fromList [(l,(i,t)) | ((l,(_,t)),i) <- zip (zip ls ps) [0..]],
  tlabels = ls
  }
 where ps = map (lookLabel (tindex t)) ls

genProject :: [(Table -> Tuple -> Value, Id)] -> Table -> Table
genProject els t = t {
  tdata = [map (\f -> f t r) funs | r <- tdata t],
  tindex = M.fromList [(l,(i,TString)) | (l,i) <- zip labels [0..]], ---- TODO type of value
  tlabels = labels
  }
 where 
   labels = map snd els
   funs = map fst els
   values = map  

select :: (Tuple -> Bool) -> Table -> Table
select cond t = t {
  tdata = filter cond (tdata t)
  }

union :: Table -> Table -> Table
union = ifSameType (\t u -> t {tdata = Data.List.union (tdata t) (tdata (changeOrder (tindex t) u))}) -- invariant: no duplicates introduced

intersect :: Table -> Table -> Table
intersect = ifSameType (\t u -> t {tdata = Data.List.intersect (tdata t) (tdata (changeOrder (tindex t) u))})

subtract :: Table -> Table -> Table
subtract = ifSameType (\t u -> t {tdata = (tdata t) \\ (tdata (changeOrder (tindex t) u))})

rename :: [Id] -> Table -> Table
rename r t = t {
  tindex = M.fromList 
    [(l,ity) | (l,ity) <- zip r (sort [(i,ty) |  (_,(i,ty)) <- M.assocs (tindex t)])],
  tlabels = r
  }

cartesian :: Table -> Table -> Table
cartesian = thetaJoin (\_ _ -> True)

groupAggregate :: [Id] -> [([Value] -> Value, (Id,Id))] -> Table -> Table
groupAggregate ls fs t = initTable {
  tdata = [[value u (head (tdata u)) l | l <- ls] ++ 
          [aggregate f x u | (f,(x,_)) <- fs] | u <- tables],
  tindex = M.fromList $ zip labels (zip [0..] (repeat TInt)), ---- TODO: types of labels
  tlabels = labels
  }
  where
   tables = groups ls t
   labels = ls ++ [val | (_,(_,val)) <- fs]

groups :: [Id] -> Table -> [Table]
groups ls t = [t{tdata = d} | d <- groupBy projg (sortBy projs (tdata t))]
  where
    proj u = [u !! i | (i,_) <- map (lookLabel (tindex t)) ls]
    projs u v = compare (proj u) (proj v)
    projg u v = proj u == proj v

aggregate :: ([Value] -> Value) -> Id -> Table -> Value
aggregate f x t = case x of
  "*" -> countAggr (tdata t) --- terrible hack to interpret SQL smoothly...
  _ -> let (i,_) = lookLabel (tindex t) x in f [u !! i | u <- tdata t]

countAggr :: [a] -> Value
countAggr = VInt . toInteger . length

avgAggr :: [Value] -> Value
avgAggr = intAggr avg where
  avg ns = sum ns `div` (toInteger (length ns))

sumAggr :: [Value] -> Value
sumAggr = intAggr sum

minAggr :: [Value] -> Value
minAggr = intAggr minimum

maxAggr :: [Value] -> Value
maxAggr = intAggr maximum

intAggr :: ([Integer] -> Integer) -> [Value] -> Value
intAggr f = \vs -> 
  VInt (f [n | v <- vs, let n = case v of VInt n -> n ; _ -> error ("cannot get integer from " ++ show v)])

distinct :: Table -> Table
distinct t = t{tdata = nub (tdata t)}

sortby :: [(Table -> Tuple -> Value,Bool)] -> Table -> Table
sortby ls tbl = tbl{tdata = sortBy projs (tdata tbl)}
  where
----    proj u = [u !! i | (i,_) <- map (lookLabel (tindex t)) ls]
    proj u = [f tbl u | (f,dir) <- ls] ---- TODO: direction Desc=True, Asc=False
    projs u v = compare (proj u) (proj v)

thetaJoin :: (Tuple -> Tuple -> Bool) -> Table -> Table -> Table
thetaJoin cond t u = initTable {
    tdata  = [x ++ y | x <- tdata t, y <- tdata u, cond x y],
    tindex = M.fromList $            -- no duplicates here
      tlabelst ++ [(l, (i + length tlabelst,ty)) | (l,(i,ty)) <- M.assocs (tindex u)],
    tlabels = tlabels t ++ tlabels u -- this can have duplicates
    }
 where
  tlabelst = M.assocs (tindex t)

--- used if renaming is needed
thetaJoins :: ([Tuple] -> Bool) -> [(Id,Table)] -> Table
thetaJoins cond idtables = initTable {
  tdata  = [concat xs | xs <- sequence (map tdata (map snd idtables)), cond xs],
  tindex = M.fromList $ 
     [(qualify q l, (i + o, ty)) | ((q,t),o) <- offsets 0 idtables, (l,(i,ty)) <- M.assocs (tindex t)],
  tlabels = [qualify q l | (q,t) <- idtables, l <- tlabels t]
  }
 where
  offsets o qts = case qts of ---- create a nice fold ;-)
    (q,t):ts -> ((q,t),o) : offsets (o + length (M.assocs (tindex t))) ts
    _ -> []

onJoin :: [Id] -> Id -> Id -> Table -> Table -> Table
onJoin ids i j t u = thetaJoins (\ [x,y] -> and [value t x a == value u y a | a <- ids]) [(i,t),(j,u)] ---- dynamic typing of t.a = u.a

naturalJoin :: Table -> Table -> Table
naturalJoin t u =
    project remainingAttrs $ onJoin commonAttrs "" "" t u  --- no qualification af attributes needed
  where
    commonAttrs = filter (flip elem (attributes u)) (attributes t)
    remainingAttrs = attributes t ++ filter (not . flip elem commonAttrs) (attributes u) 


---------------------- examples

sonTable = initTable {
  tdata = [
    [VString "Emil",  VInt 1989, VString "Stockholm"],
    [VString "Olaf",  VInt 1992, VString "Tammerfors"],
    [VString "Amos", VInt 2000, VString "Gothenburg"],
    [VString "Luke",  VInt 2004, VString "Gothenburg"]
    ],
  tindex = M.fromList $ zip (words "name year place") (zip [0..] [TString, TInt, TString])
  }

cityCountryTable = initTable {
  tdata = [
    [VString "Stockholm",VString "Sweden"],
    [VString "Gothenburg",VString "Sweden"],
    [VString "Tammerfors",VString "Finland"]
    ],
  tindex = M.fromList $ zip (words "name country") (zip [0..] (repeat TString))
  }

citySizeTable = initTable {
  tdata = [
    [VString "Stockholm", VInt 800000],
    [VString "Gothenburg",VInt 500000],
    [VString "Tammerfors",VInt 200000]
    ],
  tindex = M.fromList $ zip (words "name size") (zip [0..] (repeat TString))
  }

