module GetConfig where

import TreeConv
import Data.List (intersperse,nub,isPrefixOf)
import Data.Char (isSpace)
import qualified Data.Map.Strict as M
import qualified PGF
import GF (BindType(Explicit)) ---- should not need to import this!!
import Text.PrettyPrint (render)

getConfiguration :: [FilePath] -> Maybe PGF.PGF -> IO Configuration
getConfiguration files mpgf = do
  ss <- mapM readFile files >>= return . concatMap lines
  let ls = [takeWhile (/="--") (words l) |        -- possible tail comment separated by --
                   l@(c:_) <- ss, notElem c "-"]  -- non-empty lines, not starting with -
  let metalines = [ws | ws@(_:_) <- ls, elem "#" ws]
  let catlines  = [ws | ws@(_:_) <- ls, not (any (flip elem ws) [";", ":", "=", "#"]) ]
  let funlines  = [ws | ws@(w:_) <- ls, w /="*",elem ":" ws]   -- functions defined in the config file
  let backuplines = [ws | "*":ws <- ls]
  let deflines  = [ws | ws@(w:_) <- ls, elem "=" ws, w /= "cat"]
  let helpcatlines  = [(k,c) | "cat":k:"=":c:_ <- ls]

  let lablines  = [ws | ws@(w:_) <- ls, w /="*",elem ";" ws, notElem ":" ws] -- labels for pgf functions
  let labmap    = M.fromList [(f,(ls,ms)) | f:";":lms <- lablines, let (ls,ms) = break (elem '=') lms]
  let pgfmap    = maybe M.empty (M.fromList . pgfFunctions) mpgf
  let pgffuns   = [initFunInfo {funid = f,
                                valtype = c,
                                argtypes = zipCatsLabels cs ls,
                                morphoconstraints = ms
                                }
                        |
                      (f,(c,cs)) <- M.assocs pgfmap,
                      Just (ls,ms) <- [M.lookup f labmap]
                  ]
  let newfuns   = [fi |
                     fi <- map pFunInfo funlines,
                     case M.lookup (funid fi) pgfmap of
                       Just (c,cs) | valtype fi /= c || map fst (argtypes fi) /= cs  ->
                          error $ "CONFIGURATION ERROR: wrong type given to " ++ funid fi
                       _ -> True
                  ]
  let allfuns = newfuns ++ pgffuns                
  let bups = map pFunInfo backuplines
  let helps = M.fromList helpcatlines
  
  return $ Conf {
    grammarname = case metalines of {(_:name:_):_ -> name ; _ -> error "cannot find grammar name"},
    categories  = pCatMap catlines,
    functions   = allfuns,
    backups     = bups,
    definitions = getDefMap mpgf allfuns helps deflines,
    helpcategories = helps
    }

pFunInfo :: [String] -> FunInfo
pFunInfo s = case s of
  f : ":"  : ts ->
    let
      (typs,_:labsmor) = break (==";") (filter (/="->") ts)
      (labs,mor) = break (elem '=') labsmor
      args = zipCatsLabels (init typs) labs
    in initFunInfo {
      funid = f,
      valtype = (last typs),
      argtypes = args,
      morphoconstraints = mor
      } 
  _ -> error $ "ERROR: no function info from " ++ unwords s

zipCatsLabels typs labs = if (elem (length typs) [1,length labs])
  then zip typs (labs ++ ["head"]) -- head not marked for 1-arg functions
  else error $ "ERROR: unmatched arguments and labels in " ++ unwords typs ++ " ; " ++ unwords labs

pCatMap :: [[String]] -> CatMap
pCatMap = M.fromListWith (++) . concatMap pCatInfo where
  pCatInfo s = case s of
     c:pms -> [(p,[initCatInfo{catid=c, mconstraints=ms}]) | let (ps,ms) = break (elem '=') pms, p <- ps]
     _ -> error $ "ERROR: no category info from " ++ unwords s

getDefMap :: Maybe PGF.PGF -> [FunInfo] -> M.Map Cat Cat -> [[String]] -> DefMap
getDefMap mpgf funs helps = M.fromList . filter check . map pDefInfo where
  pDefInfo s = case break (=="=") s of
     (p:vs, _:c:cs) -> (p, (vs, pGFTree (unwords (c:cs))))
     _ -> error $ "ERROR: no definition (yet) from " ++ unwords s
  check d@(p,(vs,t)) =
    let
      typ = case lookup p [(funid fi, (valtype fi, map fst (argtypes fi))) | fi <- funs] of
          Just (c0,cs0) ->
             let (c:cs) = map normalizeCat (c0:cs0) in
             PGF.mkType [PGF.mkHypo (PGF.mkType [] (PGF.mkCId x) []) | x <- cs] (PGF.mkCId c) []
          Nothing -> error $ "ERROR IN DEFINITION: unknown function " ++ p
      exp = mkExp vs t
    in case mpgf of
      Nothing -> True
      _ | isPrefixOf "Backup" p -> True ---- to allow temporary backup functions; TODO these should disappear
      Just pgf -> either (error . (("ERROR IN DEFINITION OF " ++ p ++ " : ")++) . render . PGF.ppTcError)
                         (const True) (PGF.checkExpr pgf exp typ)
  mkExp vs (T f ts) = foldr (PGF.mkAbs Explicit)   -- \vs -> f ts ; --- the PGF.mkAbs API is very low-level
                         (mkFunApp (fun f) (map (mkExp []) ts)) [PGF.mkCId v | v <- vs]
  mkFunApp s = case s of
      '"':_:_ | last s == '"' -> const (PGF.mkStr s)
      _ -> PGF.mkApp (PGF.mkCId s)

  normalizeCat c = maybe c id $ M.lookup c helps


pGFTree :: String -> GFTree
pGFTree s = case PGF.readExpr s of
  Just e -> mkGF e
  _ -> error $ "ERROR: cannot parse GF tree " ++ s
 where
   mkGF e = case PGF.unApp e of
     Just (f,es) -> apps (PGF.showCId f) (map mkGF es)
     _ -> error $ "ERROR: cannot build GF tree from " ++ s

-- dictionary from PGF
-- problems: first lin not always the lemma; cannot get variants
pgfDictionary :: Configuration -> PGF.PGF -> Lang -> Dictionary
pgfDictionary config pgf lang = M.fromListWith (++) (configlex ++ rules) where
  rules = [((w, c), [PGF.showCId f]) |                              -- (lemma,category) -> function
              (k,c) <- [(k,c) |
                 k <- PGF.categories pgf, let c = PGF.showCId k,    -- consider only categories present in pgf
                 elem c cats],                                      -- consider only categories used in config
              f <- PGF.functionsByCat pgf k,                        -- take any function from such a category
              Just ft <- [PGF.functionType pgf f],                  -- inspect the type of the function
              let (hs,cid,_) = PGF.unType ft, null hs,              -- check that it is a basic type (i.e. no args)
              let w0 = PGF.linearize pgf cncname (PGF.mkApp f []),  -- take the first lin ---- assumes this is the lemma
              let w = unlexBind w0,                                 -- compute bind tokens (needed in stemmed Finnish)
              length (words w) == 1                                 -- exclude multiwords
              ]
  cats = nub $ map catid $ concat $ M.elems $ categories config
  cncname = PGF.mkCId (grammarname config ++ lang)                  -- e.g. UDTranslate ++ Swe
  
  configlex = [((w,catid ci),[quote w]) |                           -- add strings from config to the lexicon
                (p,cis) <- M.assocs (categories config), ci <- cis, -- they come from category definitions of form
                'l':'e':'m':'m':'a':'=':w <- mconstraints ci        --    <cat> <pos> lemma=<word>
              ] ++                                                  -- e.g.  Cop_ VERB lemma=be -> ((be,Cop_),"be")
              [((w, valtype fi),[funid fi]) | 
                fi <- functions config, null (argtypes fi),         -- they can also come from 0-place function definitions
                'l':'e':'m':'m':'a':'=':w <- morphoconstraints fi   -- of form <fun> : <cat> ; lemma=word
              ]                                                     -- e.g.  must_VV : VV ; lemma=must
              
pgfFunctions :: PGF.PGF -> [(Fun,(Cat,[Cat]))]
pgfFunctions pgf = [
    (PGF.showCId f, typ) |
      f <- PGF.functions pgf, 
      Just ft <- [PGF.functionType pgf f],
      let (hs,cid,_) = PGF.unType ft, not (null hs),                -- ft must be a true function type
      let typ = (PGF.showCId cid,
            [PGF.showCId c | (_,_,vt) <- hs, (_,c,_) <- [PGF.unType vt]])
      ]

-- from Conll2tagged.hs
-- reading stanzas for each sentence from a conll file
getSentences ls = case dropWhile (isJunk) ls of
    [] -> []
    ls2 -> case break isJunk ls2 of
      (ls21,[]) -> [ls21]
      (ls21,ls22) -> ls21 : getSentences ls22
  where isJunk line = all isSpace line || take 1 line == "#"

-- from Analyse.hs
fromTabs = map (getSep '\t') . lines
toTabs = unlines . map (blocks2sep "\t")

getSep :: Eq a => a -> [a] -> [[a]]
getSep sep xs = case break (==sep) xs of
  (x1,_:x2) -> x1 : getSep sep x2
  (x1,[]) -> x1 : []

blocks2sep :: String -> [String] -> String
blocks2sep sep = concat . intersperse sep

-------------------
-- to be deprecated

---- can be used for Fin and Eng now; more languages to be added
---- should be avoided: use pgfDictionary instead. Subcategories don't get right here.
getDictionary :: FilePath -> Lang -> IO Dictionary
getDictionary file lang = do
  ds <- readFile file >>= return . fromTabs
  case lang of
    _ | elem lang ["Fin","Eng"] -> return $ M.fromListWith (++) [((w,c), words f) |
          d@(c:_id:fw:ew:_comment:f:_) <- ds,  -- the format from fiwn
          let w = if lang=="Fin" then fw else ew
          ]
    _ -> error $ "only languages Eng and Fin recognized in this dictionary"
    
{-
-- Dictionary mapping from data

lin thing_N = mkN "thing" "things";

*Analyse> ds <- readFile "/Users/aarne/GF/lib/src/translator/DictionaryEng.gf" >>= return . lines
*Analyse> let dmap = M.fromListWith (++) [(multiwordOfFun v,[v]) | "lin":v:_ <- map words ds, catOfFun v == "N"]

N	n00002452	esine	thing

*Analyse> ws <- readFile "nouns.tmp" >>= return . fromTabs
*Analyse> writeFile "fin-eng-nouns.tsv" $ toTabs [v ++ [unwords fs] | v@(_:_:_:e:_) <- ws, Just fs <- [M.lookup e dmap]]

N	n00002452	esine	thing		thing_N


catOfFun = reverse . takeWhile (/='_') . reverse ---- the GF Dict convention...
-}



