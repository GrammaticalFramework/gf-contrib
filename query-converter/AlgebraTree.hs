{-# LANGUAGE GADTs, FlexibleContexts #-}
module AlgebraTree where
import Data.Char(isSpace)
import Data.List(groupBy)
import Control.Monad.Writer --(WriterT,tell)
import Control.Monad.State --(State,get,put)

import AbsRelAlgebra
import PrintRelAlgebra

type DotM a = WriterT [String] (State Int) a

prRelTree t = unlines ("graph {":ls++["}"])
  where
    ((i,ls),_) = (runState . runWriterT . rel2dot) t 0

rel2dot :: Rel -> DotM String
rel2dot r =
  case r of
    RTable n -> leaf n
    RSelect c r -> node1a "σ" c r
    RProject ps r -> node1a "π" ps r
    RRename ren r -> node1a "ρ" ren r
    RGroup ns as r -> node1a "γ" (ns,as) r
    RSort ss r -> node1a "τ" ss r
    RDistinct r -> node1 "δ" r
    RUnion r1 r2 -> node_n "∪" (flatten r)
    RIntersect r1 r2 -> node_n "∩" (flatten r)
    RCartesian r1 r2 -> node_n "×" (flatten r)
    RExcept r1 r2 -> node2 "∖" r1 r2
    RNaturalJoin r1 r2 -> node2 "⋈" r1 r2
--    RThetaJoin r1 c r2 -> node2a "⋈" r1 c r2
    RInnerJoin r1 ns r2 -> node2a "⋈" r1 ns r2
    RFullOuterJoin r1 ns r2 -> node2a fullOuterJoin r1 ns r2
    RLeftOuterJoin r1 ns r2 -> node2a "°⋈" r1 ns r2
    RRightOuterJoin r1 ns r2 -> node2a "⋈°" r1 ns r2
    RLet n r1 r2 -> node2 ("let "++printTree n++" =") r1 r2
  where

    -- A hack, since "⋈̊" (combining ring above) doesn't work in all browsers
    fullOuterJoin = "<table border=\"0\" cellspacing=\"-11\" cellpadding=\"-11\"><tr><td>°</td></tr><tr><td>⋈</td></tr></table>"

    -- ** Creating trees
    leaf n = node (printTree n)

    node1 lbl r = node_n lbl [r]
    node2 lbl r1 r2 = node_n lbl [r1,r2]

    node_n :: String -> [Rel] -> DotM String
    node_n lbl rs = do i <- node lbl
                       is <- mapM rel2dot rs
                       mapM_ (edge i) is
                       return i
    
    node1a :: Print a => String -> a -> Rel -> DotM String
    node1a lbl aux r = do i <- node lbl
                          iaux <- node (printTree' aux)
                          ir <- rel2dot r
                          edge_dashed i iaux
                          edge i ir
                          return i

    node2a :: Print a => String -> Rel -> a -> Rel -> DotM String
    node2a lbl r1 aux r2 = do i <- node_html lbl
                              i1 <- rel2dot r1
                              edge i i1
                              iaux <- node (printTree' aux)
                              edge_dashed i iaux
                              i2 <- rel2dot r2
                              edge i i2
                              return i

    -- ** Creating graphviz nodes and edges
    node :: String -> DotM String
    node lbl = do i <- new
                  tell [i++"[label = \""++escape lbl++"\", shape = \"plaintext\"] ; "]
                  return i

    escape = concatMap escape1
      where
        escape1 '"' = "\\\""
        escape1 '\\' = "\\\\"
        escape1 '\n' = "\\n"
        escape1 '\t' = "\\t"
        escape1 c = [c]

    -- See https://graphviz.gitlab.io/_pages/doc/info/shapes.html#html
    node_html :: String -> DotM String
    node_html lbl = do i <- new
                       tell [i++"[label = <"++lbl++">, shape = \"plaintext\"] ; "]
                       return i

    edge = edge' "solid"
    edge_dashed = edge' "dashed"
    
    edge' style i1 i2 = tell [i1++" -- "++i2++ "[style = \""++style++"\"] ;"]

    -- ** Creating node identifiers
    new = do i <- get
             put (i+1)
             return ("n"++show i)

instance (Print a,Print b) => Print (a,b) where
  prt d (a,b) = {-brackets-} (prt 0 a . doc (showChar ',') . prt 0 b)

--brackets ss = doc (showChar '{') . ss . doc (showChar '}')

{-
opsHtml = ["σ<sub>","π<sub>","ρ<sub>","γ<sub>","τ<sub>"]

symbolsHtml=["×","δ","∪","∩","∖","⋈","⋈<sub>","⋈<sup>o</sup><sub>",
             "⋈<sup>oL</sup><sub>","⋈<sup>oR</sup><sub>","→","↓"]
-}

printTree' t = convSymbols (printTree t)
  where
    convSymbols = concatMap convSymbol . groupBy (\a b->isSpace a==isSpace b)
    convSymbol s =
      case s of
        "\\rightarrow" -> "→"
        "\\delta" -> "δ"
        "\\downarrow" -> "↓"
        _ -> s

flatten :: Rel -> [Rel]
flatten t =
  case t of
    RUnion _ _ -> flat union t
    RIntersect _ _ -> flat intersect t
    RCartesian _ _ -> flat cartesian t
  where
    flat op t = maybe [t] (\(t1,t2)->flat op t1++flat op t2) (op t)

    union, intersect, cartesian :: Rel -> Maybe (Rel,Rel)

    union (RUnion t1 t2) = Just (t1,t2)
    union _ = Nothing

    intersect (RIntersect t1 t2) = Just (t1,t2)
    intersect _ = Nothing

    cartesian (RCartesian t1 t2) = Just (t1,t2)
    cartesian _ = Nothing
