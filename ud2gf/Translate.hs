module Translate where

import TreeConv
import PGF
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List
import Text.PrettyPrint (render)
import Debug.Trace

tracePr v = v ----trace ("#" ++ show v) v
traceMsgPr m v = v ----trace ("#" ++ m ++ " " ++ show v) v

gftree2pgftree :: GFTree -> PGF.Tree
gftree2pgftree = gf2pgf
 where
  gf2pgf (T f ts) = mkFunApp (fun f) (map gf2pgf ts)
  mkFunApp s = case s of
      '"':_:_ | last s == '"' -> const (mkStr s)
      _ -> mkApp (mkCId s)

abstree2gftree :: Configuration -> AbsTree -> GFTree
abstree2gftree config at@(T an _) =
  wrapBackup config (cat an) (backtrees an) (gftree an)

-- annotatate with endo- and exocentric function applications
abstreeAnnotFuns :: Configuration -> AbsTree -> AbsTree
abstreeAnnotFuns config (T an ats) =
   let
     ats1 = map (annotTree) ats       -- bottom-up: annotate subtrees first
     an1  = annot an ats1             -- then build the tree in the top node
     an2  = applyBackup an1 ats1      -- then apply backup functions to gather the remaining children
     ats2 = ats1
   in T an2 ats2   

 where

  annotTree  = abstreeAnnotFuns config
  funApps    = funAppsOn config (TreeConv.functions config)
  backupApps = funAppsOn config (backups config)

  annot an ats =
    let
    
      funapps  = funApps an ats
      endofuns = [tcu | (tcu,True)  <- funapps]
      exofuns  = [tcu | (tcu,False) <- funapps]
      
    in case (endofuns,exofuns) of
    
      -- terminate if no functions apply
      ([], []) -> an {gftree = t, cat = c, treecands = finalcands}        
                    where
                      (t,c):finalcands = bestCands (allTreecands an)
                      
      -- try endocentric funtions if available
      (_:_, _) -> annot (an {gftree = t, cat=c, treecands = cands}) ats
                    where
                      (t,c):cands = bestCands $ endofuns ++ allTreecands an
                      
     -- if not, try exocentric functions
      (_, _:_) -> annot (an {gftree = t, cat=c, treecands = cands}) ats
                    where
                      (t,c):cands = bestCands $ exofuns ++ allTreecands an

  bestCands tcs =
    let
      tls  = [((t,c),(length ns,sizeTree t)) |
               (t,c) <- tcs, let ns = nodesUsedGen src t]     -- cands with coverage and size
      stls = sortBy (\ (_,m) (_,n) -> compare n m) tls        -- descending order
    in map fst $ case stls of                                               
        (_,(m,_)):_ -> takeWhile ((==m) . fst . snd) stls     -- choose cands with maximal coverage ;
        _ -> stls                                             -- size can differ if cat is different                    

  applyBackup an ats = 
    let
      useds   = nub $ nodesUsedGen src (gftree an)                  -- list the children used in the actual gftree
      ats1    = [at | at <- ats, notElem (positio (root at)) useds] -- list the children that are not used
      backs   = [t |                                                -- find one Backup for each of these children
                   at@(T n ts) <- ats1,
                   t <- take 1 $ sortBy                             -- take the maximal backup to get the best lin
                      (\t u -> compare (sizeTree t) (sizeTree u))
                                [t | ((t,_),_) <- backupApps n ts]]
    in
      an{backtrees = backs}   -- just store the backup at this point: it may be applied to any candidate later


-- all possible function application result on the current tree, both endo- and exocentric
funAppsOn :: Configuration -> [FunInfo] -> AbsNode -> [AbsTree] -> [((GFTree,Cat),Bool)]
funAppsOn config funinfos an ats =
  [((tree,cv),isEndo)    -- type of head, value type, if endo
      |
    let posan = positio an,                                 -- note the position of the root

                                                            -- 1. select the head tree candidate from the root
    (tt,ct) <- allTreecands an,                                -- a candidate tree and its type given in the root
    let uds = nodesUsedGen src tt,                             -- note which nodes have been used by this candidate
    
                                                            -- 2. collect all candidates from the subtrees
    let givenArgs = [((c,lab rat),(t,(c,back))) |                 -- category c of candidate t, from subtree with this label
                         at    <- ats, let rat = root at,         -- coming from any subtree
                         let back = backtrees rat,                -- also record the backup for the tree
                         (t,c) <- allTreecands rat,               -- and any candidate in that tree
                         let subuds = nodesUsedGen src t,         -- note which nodes have been used by this subtree
                         not (any (\n -> elem n uds) subuds)      -- this subtree may not contain nodes already used
                         ],
    let allGivenArgs = ((ct,"head"),(tt,(ct,[]))) : givenArgs,    -- add the head tree to the given args
                                                                  -- its backup will be added at the last step
                                                                  -- it can use the old tree in the same node as subtree
    
                                                            -- 3. select a possible function to apply
    fi <- funinfos, (ca,"head") <- argtypes fi, ca == ct,      -- function whose head cat matches the candidate
    and [hasMorpho tags mo an | mo <- morphoconstraints fi],   -- and the root satisfies its morpho constraints
    let cv = valtype fi,                                       -- its value type can be any cat cv
    let soughtArgs = argtypes fi,                              -- arguments sought for the function

                                                            -- 4. build a new tree to be added to candidates
    Just tbs <- [mapM (\x -> lookup x allGivenArgs) soughtArgs], -- make sure you can find all sought arguments
    let fu = initGFNode{fun=funid fi},                           -- mark the function with the current position
    let ts = [wrapBack c b t | (t,(c,b)) <- tbs],                -- apply the backups to the embedded arguments (except head),
    let tree = T fu ts,                                          -- apply the function to the arguments found
    isNewCand tree,                                              -- don't add the same tree again
    let isEndo = ca == cv                                        -- endocentric iff the type of the tree doesn't change
  ]
 where
   isNewCand t = notElem t [u | (u,_) <- allTreecands an]
   wrapBack = wrapBackup config

wrapBackup :: Configuration -> Cat -> [GFTree] -> GFTree -> GFTree
wrapBackup config c backs t = case backs of
  [] -> t
  _  -> T appw [t, app2 "MkBackups" bu1 bu2]
 where
  appw = initGFNode{fun = backupPrefix ++ c} ---- TODO: define backupPrefix in config ?

  sbs  = sort [(src (root b),b) | b <- backs]  -- sort by position
  srct = src (root t)
  bu1  = comb [b | (i,b) <- sbs, i <  srct]
  bu2  = comb [b | (i,b) <- sbs, i >= srct] --- cannot be ===
  comb ts = case ts of
    [] -> app0 "BaseBackup"               ---- TODO: define Base,ConsBackup in config?
    t:tt -> app2 "ConsBackup" t (comb tt)

-- restore the tree without backup functions; used for coverage statistics
ignoreBackups :: GFTree -> GFTree
ignoreBackups t = case t of
  T f [b,c] | isBackup f -> ignoreBackups c
  T f ts -> T f (map ignoreBackups ts)
 where
   isBackup f = isPrefixOf backupPrefix (fun f)

backupPrefix = "Backup"

-- eliminate helper functions and unknown lexical functions
cleanupGFTree :: Configuration -> GFTree -> GFTree
cleanupGFTree config = unAux . unSyncat where
  unAux t@(T f ts) = case (fun f, map unAux ts) of
  
    (c,ts1) -> case M.lookup c defs of
      Just (xs,d) -> eval (zip xs ts1) d
      _ -> T f ts1

  defs = definitions config
  
  unSyncat t = case t of
    t -> t -----
   ---- (filter (not . syn . root) ts))

-- a call-by-value functional language interpreter
  eval env t@(T g us) =
    let us1 = map (eval env) us
    in case lookup (fun g) env of
         Just v -> v
         _ -> T g us1

prPGFTree :: PGF.Tree -> String
prPGFTree = showExpr []

prPGFTreeLong :: PGF.Tree -> String
prPGFTreeLong t = maybe (prPGFTree t) prGFTreeLong (mgf t) where
   mgf e = case PGF.unApp e of
     Just (f,es) -> fmap (apps (PGF.showCId f)) (mapM mgf es)
     _ -> case unStr e of
       Just s -> return $ app0 s
       _ -> error $ "prpgf " ++ prPGFTree e ----Nothing

--- type checking is needed as long as the configurations file is not type-checked wrt the grammar
linTree :: PGF -> PGF.Tree -> [String]
linTree pgf t = case inferExpr pgf t of
  Left err  -> ["TYPE ERROR: " ++ render (ppTcError err)]
  Right (exp,_) -> map (("STRING TRANSLATION: " ++) . unlexBind) (linearizeAll pgf exp)

missingFunctions :: S.Set CId -> GFTree -> [Fun]
missingFunctions funs t = [f | f <- funsIn t, notString f, not (S.member (mkCId f) funs)] where
  funsIn (T f ts) = fun f : concatMap funsIn ts
  notString f = take 1 f /= "\""


