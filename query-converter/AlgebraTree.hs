{-# LANGUAGE GADTs, FlexibleContexts #-}
module AlgebraTree where
import Control.Monad.Writer --(WriterT,tell)
import Control.Monad.State --(State,get,put)

import AbsRelAlgebra
import PrintRelAlgebra

type DotM a = WriterT [String] (State Int) a

prRelTree t = unlines ("graph {":ls++["}"])
  where
    ((i,ls),_) = (runState . runWriterT . rel2dot) t 0

rel2dot :: Rel -> DotM String
rel2dot t =
  case t of
    RTable n -> leaf n
    RSelect c r -> node1 "σ" c r
    RProject ps r -> node1 "π" ps r
    RRename ren r -> node1 "ρ" ren r
    RGroup ns as r -> node1 "γ" (ns,as) r
    RSort ss r -> node1 "τ" ss r
    RDistinct r -> node0 "δ" r
    RUnion r1 r2 -> node2 "∪" r1 r2
    RIntersect r1 r2 -> node2 "∩" r1 r2
    RCartesian r1 r2 -> node2 "×" r1 r2
    RExcept r1 r2 -> node2 "∖" r1 r2
    RNaturalJoin r1 r2 -> node2 "⋈" r1 r2
    RThetaJoin r1 c r2 -> node3 "⋈" r1 c r2
    RInnerJoin r1 ns r2 -> node3 "⋈" r1 ns r2
    RFullOuterJoin r1 ns r2 -> node3 "⋈<sup>o</sup>" r1 ns r2
    RLeftOuterJoin r1 ns r2 -> node3 "⋈<sup>oL</sup>" r1 ns r2
    RRightOuterJoin r1 ns r2 -> node3 "⋈<sup>oR</sup>" r1 ns r2
    RLet n r1 r2 -> node2 "let" r1 r2
  where
    -- ** Creating trees
    leaf n = node (printTree n)

    node0 :: String -> Rel -> DotM String
    node0 lbl r = do i <- node lbl
                     ir <- rel2dot r
                     edge i ir
                     return i
    
    node1 :: Print a => String -> a -> Rel -> DotM String
    node1 lbl aux r = do i <- node lbl
                         iaux <- node (printTree aux) -- !!!
                         ir <- rel2dot r
                         edge_dashed i iaux
                         edge i ir
                         return i

    node2 :: String -> Rel -> Rel -> DotM String
    node2 lbl r1 r2 = do i <- node lbl
                         i1 <- rel2dot r1
                         edge i i1
                         i2 <- rel2dot r2
                         edge i i2
                         return i

    node3 :: Print a => String -> Rel -> a -> Rel -> DotM String
    node3 lbl r1 aux r2 = do i <- node_html lbl
                             i1 <- rel2dot r1
                             edge i i1
                             iaux <- node (printTree aux)
                             edge_dashed i iaux
                             i2 <- rel2dot r2
                             edge i i2
                             return i

    -- ** Creating graphviz nodes and edges
    node :: String -> DotM String
    node lbl = do i <- new
                  tell [i++"[label = \""++escape lbl++"\", shape = \"plaintext\"] ; "]
                  return i

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
  prt d (a,b) = brackets (prt 0 a . doc (showChar ',') . prt 0 b)

brackets ss = doc (showChar '{') . ss . doc (showChar '}')

escape = concatMap escape1
  where
    escape1 '"' = "\\\""
    escape1 '\\' = "\\\\"
    escape1 '\n' = "\\n"
    escape1 '\t' = "\\t"
    escape1 c = [c]

{-
opsHtml = ["σ<sub>","π<sub>","ρ<sub>","γ<sub>","τ<sub>"]

symbolsHtml=["×","δ","∪","∩","∖","⋈","⋈<sub>","⋈<sup>o</sup><sub>",
             "⋈<sup>oL</sup><sub>","⋈<sup>oR</sup><sub>","→","↓"]
-}