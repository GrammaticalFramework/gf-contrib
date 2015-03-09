module Design where

import Data.List
import Data.Char
import System.Process

--------------------------
-- AR 6/2/2015
-- conversions of E-R models and database schemas:
--
--    simple text format for E-R  -->  Haskell data object   -->  graphviz   
--                                                           -->  schema
--  to test in ghci:
--
--  >  displayER tex1
--
-- you need to have graphviz installed
--
-- TODO: 3+ place relations with uniqueness arrows, weak ISA entities

------------------------------
-- syntax;
--
--   "ENTITY" Name Attr*
--   "WEAK ENTITY" Name StrongName RelName Attr*
--   "RELATIONSHIP" Name FromName ("--" | "-)" | "->") Attr*
--   "ISA" Name SuperName Attr*
--
-- one entry per line, tokens separated by spaces
-- attribute syntax: _a means key attribute

------------------- Jonas's examples using the simple text format

tex1 = getERDiagram [
  "ENTITY A _a1 _a2 a3",
  "ENTITY B _b1 b2",
  "RELATIONSHIP R A -- B"
  ]

tex2 = getERDiagram [
  "ENTITY A _a1",
  "ENTITY B _b1",
  "RELATIONSHIP R A -) B"
  ]

tex3 = getERDiagram [
  "WEAK ENTITY A B R _a1",
  "ENTITY B _b1"
  ]

tex4 = getERDiagram [
  "ENTITY A _a1",
  "ENTITY B _b1",
  "RELATIONSHIP R A -> B"
  ]

tex5 = getERDiagram [
  "ENTITY B _b1 b2",
  "ISA A B a1"
  ]


-------------------------------
-- the function displaying everything

displayER e = do
  writeFile "er-tmp.dot" $ prERDiagram e
  system "fdp -Tpng er-tmp.dot >er-tmp.png" -- dot or neato sometimes better
  system "open er-tmp.png"  -- mac
--  system "eog er-tmp.png" -- linux
  putStrLn $ prSchema $ erdiagram2schema SER e  -- only E-R strategy implemented; OO and Null TODO
  putStrLn ""
  putStrLn $ erdiagram2text e
  return ()

-- reading a textfile

file2ER file = do
  s <- readFile file >>= return . filter (not . all isSpace) . lines
  let er = getERDiagram s
  displayER er

--------------------------------
-- ER datatypes

type ERDiagram = [ERElement]

data ERElement = 
    EEntity EStrength Ident [(Ident,Bool)]                      -- entity name, [attributes; True if key]
  | ERelationship Ident [(Ident,(EArrow,Maybe Ident))] [Ident]  -- rel name, entity names, arrow names, attrs
  | ESubEntity EStrength Ident Ident [Ident]                    -- ISA relation
  -- strong/weak, rel name, [entity,arrow type arrow label], [attribute]

data EArrow =
    EMany
  | EAtMostOne
  | EExactlyOne

data EStrength =
    EStrong
  | EWeak Ident Ident -- weak depending on a strong one by a relation

type Ident = String

----------------------------
-- generating graphviz

prERDiagram :: ERDiagram -> String
prERDiagram = unlines . surround . map (unlines . prERElement)
  where
   surround ls = "digraph ER {" : "nodesep=4.0 fontsize=10" : ls ++ ["}"]

prERElement :: ERElement -> [String]
prERElement e = case e of
  EEntity EStrong name attrs -> 
    (name ++ " [shape=box fontsize=10 " ++ "] ;") :
    [name ++ "_" ++ attr ++ " [shape=ellipse fontsize=10 label=" ++ quote (status b attr) ++ "]" | (attr,b) <- attrs] ++
    [name ++ "_" ++ attr ++ " -> " ++ name ++ " [arrowhead=none]"  | (attr,_) <- attrs] 
  EEntity (EWeak strong rel) name attrs -> 
    (name ++ " [shape=box style=bold fontsize=10] ;") :
    [name ++ "_" ++ attr ++ " [shape=ellipse, label=" ++ quote (status b attr) ++ "]" | (attr,b) <- attrs] ++
    [name ++ "_" ++ attr ++ " -> " ++ name ++ " [arrowhead=none]"  | (attr,_) <- attrs] ++
    [rel ++ " [shape=diamond style=bold fontsize=10] ;"] ++ [
      name ++ " -> " ++ rel ++ " [arrowhead=none]", 
      rel  ++ " -> " ++ strong ++ " [arrowhead=curve]"
    ]
  ERelationship name ents attrs -> 
    (name ++ " [shape=diamond fontsize=10 " ++ "] ;") :
    [name ++ "_" ++ attr ++ " [shape=ellipse fontsize=10 label=" ++ quote attr ++ "]" | attr <- attrs] ++
    [name ++ "_" ++ attr ++ " -> " ++ name ++ " [arrowhead=none]"  | attr <- attrs] ++
    [name ++  " -> " ++ ent ++ arrowhead arr ++ maybe "" (\l -> "[label=" ++ l ++ " fontsize=10]") ml  | (ent,(arr,ml)) <- ents]     
  ESubEntity strength name y attrs -> 
    let isaxy = "isa_" ++ name ++ "_" ++ y in
    (name ++ " [shape=box fontsize=10 " ++ style strength ++ "] ;") :
    [name ++ "_" ++ attr ++ " [shape=ellipse fontsize=10 label=" ++ quote attr ++ "]" | attr <- attrs] ++ 
    [name ++ "_" ++ attr ++ " -> " ++ name ++ " [arrowhead=none]"  | attr <- attrs] ++ [
      isaxy ++ " [shape=triangle fontsize=10 label=\"ISA\"] ;" , 
      name ++ " -> " ++ isaxy ++ " [arrowhead=none]", 
      isaxy ++ " -> " ++ y ++ " [arrowhead=curve]"
     ]
 where
   style s = case s of
     EStrong -> ""
     EWeak _ _ -> "style=bold"
   status b a = if b then "_" ++ a else a
   arrowhead a = case a of
     EAtMostOne -> ""
     EExactlyOne -> " [arrowhead=curve]"
     _ -> " [arrowhead=none]"

quote s = "\"" ++ s ++ "\""

-- explicit example

ex1 :: ERDiagram
ex1 = [
  EEntity EStrong "Course" [("code",True),("name",False)],
  EEntity (EWeak "Course" "Given") "GivenCourse" [("period",True)],
  ESubEntity EStrong "LimitedCourse" "Course" ["nplaces"],
  EEntity EStrong "Teacher" [("name",True)],
  ERelationship "TaughtBy" [("GivenCourse",(EMany,Nothing)),("Teacher",(EAtMostOne,Nothing))] ["ntimes"],
  ERelationship "Required" [("Course",(EMany,Just "before")),("Course",(EAtMostOne,Just "after"))] []
  ]

---------------------------
---------------- schemas

type Schema = [Relation]

data Relation = Rel {
  name       :: Ident, 
  attributes :: [(Ident,Bool)], 
  references :: [Reference],
  fundeps    :: [FunDep]
  }

relation :: Ident -> Relation
relation name = Rel name [] [] []

type Reference = (Ident,(Ident,Ident))   -- x -> y.z

type FunDep = ([Ident],Ident)

prSchema :: Schema -> String
prSchema = unlines . map (unlines . prRelation)

prRelation :: Relation -> [String]
prRelation r = [
  name r ++ "(" ++ concat (intersperse "," (map prAttr (attributes r))) ++ ")"
  ] ++ [
  "  " ++ x ++ " -> " ++ y ++ "." ++ z | (x,(y,z)) <- references r
  ]
 where
   prAttr (a,b) = if b then "_" ++ a else a


--------------- translate E-R to schema

---- not compositional, because of exactlyone relations that are eliminated and have effects on entities
-- policy: create qualified names for foreign attributed: camel script, "entityAttribute"

erdiagram2schema :: Style -> ERDiagram -> Schema
erdiagram2schema sty er = map trSchema (filter (not . isFunction) er)
  where
    trSchema :: ERElement -> Relation
    trSchema e = case e of
      EEntity (EWeak strong _) name attrs -> (relation name){
        attributes = attrs ++ [(k,True) | k <- keys strong],
        references = [(k,(strong,k)) | k <- keys strong]
        }
      EEntity EStrong name attrs -> 
          let exacts = [(k,b) | fab@(f,(a,b)) <- functions, a == name, k <- keys b] 
          in (relation name){
        attributes = attrs ++ 
                     [(qualif b k,False) | (k,b) <- exacts],
        references = [(qualif b k,(b,k)) | (k,b) <- exacts]
        }
      ESubEntity strength name y attrs -> case sty of
        _ -> let kys = keys y in
             (relation name){
               attributes = [(k,True) | k <- kys] ++ [(a,False) | a <- attrs],
               references = [(k,(y,k)) | k <- kys]
               } ---- just er style
      ERelationship name ents attrs -> (relation name){
        attributes = [(mqualif mi e k,status arr)  | (e,(arr,mi)) <- ents, k <- keys e] ++ [(a,False) | a <- attrs],
        references = [(mqualif mi e k,(e,k))       | (e,(arr,mi)) <- ents, k <- keys e]
        }
    keys y = case lookup y [(r,[k | (k,True) <- attrs]) | EEntity _ r attrs <- er] of
      Just ks -> ks
      _ -> error $ "entity " ++ y ++ " not found"
    qualif (e:es) (k:ks) = toLower e : es ++ [toUpper k] ++ ks
    mqualif mi e k = case mi of
      Just i -> i
      _ -> qualif e k  
    functions = [(f,(a,b)) | ERelationship f [(a,_), (b,(EExactlyOne,_))] _ <- er] ---- attrs? many-place?
    isFunction e = case e of
      ERelationship f _ _ -> elem f (map fst functions)
      _ -> False
    status arr = case arr of
      EMany -> True
      _ -> False -- no need to use uniquely determined attribute as key

data Style = SER | SOO | SNull

---------- simple text format for E-R descriptions

getERDiagram :: [String] -> ERDiagram
getERDiagram = map getERElement

getERElement :: String -> ERElement
getERElement s = case words s of
  "WEAK":"ENTITY":e:d:r:xs    -> EEntity (EWeak d r) e (map getAttr xs) 
  "ENTITY":e:xs               -> EEntity EStrong e (map getAttr xs)
  "RELATIONSHIP":f:e:arr:d:xs -> ERelationship f [(e,(EMany,Nothing)), (d,(getArrow arr,Nothing))] xs
  "ISA":e:d:xs                -> ESubEntity EStrong e d xs
  _ -> error $ "cannot get E-R element from " ++ s
 where
   getAttr x = case x of
     '_':cs -> (cs,True)
     _ -> (x,False)
   getArrow x = case x of
     "--" -> EMany
     "->" -> EAtMostOne
     "-)" -> EExactlyOne
     _ -> error $ "cannot get arrow from " ++ x


------------- natural language generation

erdiagram2text :: ERDiagram -> String
erdiagram2text = unlines . map (mkSentence . unwords . trEl)
 where
   trEl e = case e of
     EEntity EStrong name attrs -> 
       trEnt indef name ++ ["has"] ++ conj (map (trAttr . fst) attrs)

     EEntity (EWeak strong _) name attrs -> 
       trEnt indef name ++ ["of"] ++ trEnt indef strong ++ ["has"] ++ conj (map (trAttr . fst) attrs)

     ESubEntity strength name y attrs -> 
       trEnt indef name ++ ["is"] ++ trEnt indef y ++ ["that has"] ++ conj (map trAttr attrs)

     ERelationship name ents@((x,(_,_)):(y,(arr,_)):_) attrs ->  ---- ignoring first arrow, arrow labels, more than two args
       trEnt indef x ++ ["can"] ++ trRel infinitive name ++ trModEnt indef arr y ++ ifn attrs "with" ++ conj (map trAttr attrs)

   trEnt form e = let ue = uncamel e in [indefArt ue, ue]

   trModEnt form arr e = case arr of
     EMany -> trEnt form e
     EExactlyOne -> ["exactly", "one", uncamel e]
     EAtMostOne -> ["at", "most", "one", uncamel e]

   trAttr a = trEnt indef a

   trRel form r = let ue = uncamel r 
                  in case words ue of
                       "is":ws -> "be":ws
                       "has":ws -> "have":ws
                       v:ws     -> init v : ws  ---- removing s to form infinitive

   conj ts = concat $ intersperse ["and"] ts

   ifn xs s = if null xs then [] else [s]

   indef = "indef"
   infinitive = "infinitive"

   indefArt s = if elem (head s) "aeio" then "an" else "a" ---- must be in the lexicon


   mkSentence (c:cs) = toUpper c : cs ++ "."


uncamel = map toLower . uncam where
   uncam s = case break isUpper s of 
     ([],c:s2) -> c : uncam s2 
     (s1,c:s2) -> s1 ++ " " ++ c:uncam s2
     (s1,[]) -> s1






