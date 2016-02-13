module Design where

import Viewer
import Data.List
import Data.Char
import System.Process

--------------------------
-- AR 6/2/2015 - 25/1/2016
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
--   "WEAK ENTITY" Name (StrongName RelName)+ ":" Attr*
--   "RELATIONSHIP" Entity (("--" | "-)" | "->") EntityName Role?)+ (":" Attr+)?
--   "ISA" Name SuperName Attr*
--
-- one entry per line, tokens separated by spaces
-- attribute syntax: _a means key attribute
-- role syntax: use parentheses around role name: (role)

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

tex6 = getERDiagram [
  "ENTITY Currency _code",
  "ENTITY Date _day",
  "RELATIONSHIP HasValue -- Currency (of)  -- Currency (in) -- Date : value"
  ]


-------------------------------
-- the function displaying everything

displayER e = do
  writeFile "er-tmp.dot" $ prERDiagram e
  system "fdp -Tpng er-tmp.dot >er-tmp.png" -- dot or neato sometimes better
  system $ viewer ++ " er-tmp.png"
  putStrLn $ prSchema $ erdiagram2schema SER e  -- only E-R strategy implemented; OO and Null TODO
  putStrLn ""
  putStrLn $ erdiagram2text e
  return ()

-- reading a textfile

file2ER file = do
  s <- readFile file >>= return . filter (not . isPrefixOf "#") . filter (not . all isSpace) . lines
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
  | EWeak [(Ident,Ident)] -- weak depending on a number of stronerg ones by weak relationships

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
  EEntity (EWeak strongrels) name attrs -> 
    (name ++ " [shape=box style=bold fontsize=10] ;") :
    [name ++ "_" ++ attr ++ " [shape=ellipse, label=" ++ quote (status b attr) ++ "]" | (attr,b) <- attrs] ++
    [name ++ "_" ++ attr ++ " -> " ++ name ++ " [arrowhead=none]"  | (attr,_) <- attrs] ++
    [rel ++ " [shape=diamond style=bold fontsize=10] ;" | (_,rel) <- strongrels] ++
    concat [
      [
      name ++ " -> " ++ rel ++ " [arrowhead=none]",
      rel  ++ " -> " ++ strong ++ " [arrowhead=curve]"
      ]
        | (strong,rel) <- strongrels
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
     EWeak _ -> "style=bold"
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
  EEntity (EWeak [("Course","Given")]) "TeachingInstance" [("period",True)],
  ESubEntity EStrong "LimitedCourse" "Course" ["numberOfPlaces"],
  EEntity EStrong "Teacher" [("name",True)],
  ERelationship "IsTaughtBy" [("TeachingInstance",(EMany,Nothing)),("Teacher",(EAtMostOne,Nothing))] ["numberOfTimes"],
  ERelationship "Requires" [("Course",(EMany,Just "before")),("Course",(EAtMostOne,Just "after"))] []
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
      EEntity (EWeak strongrels) name attrs -> (relation name){
        attributes = attrs ++ [(qualif strong k, True)       | (strong,rel) <- strongrels, k <- keys strong],
        references =          [(qualif strong k, (strong,k)) | (strong,rel) <- strongrels, k <- keys strong]
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
    keys y = case lookup y entitiesWithKeys of
      Just (e,ks) -> case e of
         EEntity (EWeak strongrels) _ _ -> ks ++ [qualif strong k | (strong,rel) <- strongrels, k <- keys strong] 
         _ -> ks
      _ -> error $ "entity " ++ y ++ " not found"
    entitiesWithKeys = [(r,(e,[k | (k,True) <- attrs])) | e@(EEntity _ r attrs) <- er] ++
                       [(r,(e,[])) | e@(ESubEntity _ r _ attrs) <- er]
    qualif (e:es) (k:ks) = toLower e : es ++ [toUpper k] ++ ks
    mqualif mi e k = case mi of
      Just i -> qualif i k
      _ -> qualif e k  
    functions = [(f,(a,b)) | ERelationship f abs _ <- er, (a,_) <- abs, (b,(EExactlyOne,_)) <- abs, a/=b] ---- attrs? 
----    functions = [(f,(a,b)) | ERelationship f [(a,_), (b,(EExactlyOne,_))] _ <- er] ---- attrs? many-place?
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
  "WEAK":"ENTITY":e:xs | elem ":" xs -> EEntity (EWeak (getWeak ds)) e (map getAttr ys) where (ds,_:ys) = span (/=":") xs -- general case with many supportings
  "WEAK":"ENTITY":e:d:r:xs    -> EEntity (EWeak [(d,r)]) e (getAttrs xs) -- special case with just one supporting relation and entity
  "ENTITY":e:xs               -> EEntity EStrong e (getAttrs xs)
  "RELATIONSHIP":f:xs         -> ERelationship f es ys where (es,ys) = getArrAndAttr xs -- general case -> A -> B -> C 
  "ISA":e:d:xs                -> ESubEntity EStrong e d (map fst (getAttrs xs))
  _ -> error $ "cannot get E-R element from " ++ s
 where
   getAttrs = filter ((/=":") . fst) . map getAttr --- for bw compatibility: there are special cases in which colon is not compulsory before
   getAttr x = case x of
     '_':cs -> (cs,True)
     _ -> (x,False)
   getArrow x = case x of
     "--" -> EMany
     "->" -> EAtMostOne
     "-)" -> EExactlyOne
     _ -> error $ "cannot get arrow from " ++ x
   getArrAndAttr xs = case span (/=":") xs of
     (es,_:ys) -> (getArrows es, ys)
     _         -> (getArrows xs, [])
   getArrows xs = case xs of
     a@('-':_) : e :   ('(':r) : ys -> (e,(getArrow a, Just (init r))) : getArrows ys
     a@('-':_) : e : b@('-':_) : ys -> (e,(getArrow a, Nothing)) : getArrows (b:ys)
     a@('-':_) : e : []             -> (e,(getArrow a, Nothing)) : []
     e         : a@('-':_) : d : [] -> [(e,(EMany,Nothing)), (d,(getArrow a,Nothing))] --- special case A -> B
     []                             -> []
     _                              -> error $ "cannot get related entities from " ++ unwords xs
   getWeak xs = case xs of
     d:r:ys -> (d,r):getWeak ys
     [] -> []
     _ -> error $ "cannot get weak entity support from " ++ unwords xs


------------- natural language generation: very experimental and brittle

erdiagram2text :: ERDiagram -> String
erdiagram2text = unlines . map (mkSentence . unwords . trEl)
 where
   trEl e = case e of
     EEntity EStrong name attrs -> 
       trEnt indef name ++ hasAttrs attrs

     EEntity (EWeak strongrels) name attrs ->
       let strongs = concat [uncamel rel : trEnt indef strong | (strong,rel) <- strongrels]  --- relations are prepositions...
       in  trEnt indef name ++ strongs ++ hasAttrs attrs

     ESubEntity strength name y attrs -> 
       trEnt indef name ++ ["is"] ++ trEnt indef y ++ ifn attrs ["that", "has"] ++ conj (map trAttr attrs)

     ERelationship name ents@((x,(_,_)):(y,(arr,_)):_) attrs ->  ---- ignoring first arrow, arrow labels, more than two args
       trEnt indef x ++ ["can"] ++ trRel infinitive name ++ trModEnt indef arr y ++ ifn attrs ["with"] ++ conj (map trAttr attrs)

   hasAttrs attrs = ifn attrs ["has"] ++ conj (map (trAttr . fst) attrs)

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
                       v:ws | last v == 's'  -> init v : ws  ---- removing s to form infinitive
                       v:ws     -> v : ws  ---- leave the verb as it is

   conj ts = concat $ intersperse ["and"] ts

   ifn xs s = if null xs then [] else s

   indef = "indef"
   infinitive = "infinitive"

   indefArt s = if elem (head s) "aeio" then "an" else "a" ---- must be in the lexicon


   mkSentence (c:cs) = toUpper c : cs ++ "."


uncamel = map toLower . uncam where
   uncam s = case break isUpper s of 
     ([],c:s2) -> c : uncam s2 
     (s1,c:s2) -> s1 ++ " " ++ c:uncam s2
     (s1,[]) -> s1


