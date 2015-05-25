concrete YAQL1SPARQL of YAQL = open Prelude in 
{


lincat 
Move,  
Entity, 
[Entity], 
Preposition, 
[Property],
Relation, 
QuestionAdverb,
--QuestionPhrase,
Numeric,
Polarity,
Temporality = Str ;

Query = {wh1 : Str ; wh2 : Str ; prop : Str} ;
QuestionPhrase, Kind, Term, Property = {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str};

lin 

MQuery q = "PREFIX painting: <http://spraakbanken.gu.se/rdf/owl/painting.owl#> $n PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> $n PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> $n SELECT distinct "++ q.wh1 ++ "$n WHERE { $n ?painting rdf:type painting:Painting . $n " ++ " ?painting " ++ q.wh2 ++ "$n" ++ q.prop++". }" ;

  TAll k = k ; 

MAllAbout t = "PREFIX painting: <http://spraakbanken.gu.se/rdf/owl/painting.owl#> $n PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> $n PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> $n SELECT distinct ?painting ?title ?author ?year ?length ?height ?museum $n  WHERE $n {" ++ t.type ++ ";" ++ "$n" ++t.prefix ++ "$n" ++ t.museum ++ "$n" ++ t.year ++ "$n" ++ t.size ++ "$n" ++  t.color ++ "$n" ++ t.suffix ++ "$n" ++ t.filter ++"} $n LIMIT 200" ; 

-- probably should change this by having a wrapper for the query inside the Painting query that adds the first path...

KProperty k prop = {prefix = k.prefix ; 
                    type = case prop.hasType of 
                      {True => prop.type; 
                       False => k.type}; 
                     hasType = orB k.hasType prop.hasType;
                     material = case prop.hasMaterial of
                      {True => prop.material;
                       False => k.material};
                     hasMaterial = orB k.hasMaterial prop.hasMaterial;
                     museum = case prop.hasMuseum of 
                      {True => prop.museum;
                       False => k.museum};
                     hasMuseum = orB k.hasMuseum prop.hasMuseum;
                     year = case prop.hasYear of 
                       {True => prop.year ;
                        False => k.year}; 
                     hasYear = orB k.hasYear prop.hasYear ;
                     size = case prop.hasSize of 
                       {True => prop.size ;
                        False => k.size};
                     hasSize = orB k.hasSize prop.hasSize ;
                     color = case prop.hasColor of 
                        {True => prop.color;
                         False => k.color};
                     hasColor = orB k.hasColor prop.hasColor ;
                     suffix = k.suffix ;
                     filter = k.filter ++ "$n" ++ prop.filter 
                    }; 

PKind k = k ; 
TSome k = k ;

MShowTerm t = "PREFIX painting: <http://spraakbanken.gu.se/rdf/owl/painting.owl#> $n PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> $n PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> $n SELECT distinct ?painting ?title ?author ?year ?length ?height ?museum $n  WHERE $n {" ++ t.type ++ ";" ++ "$n" ++ t.prefix ++ "$n" ++ t.museum ++ "$n" ++ t.year ++ "$n" ++ t.size ++ "$n" ++ t.color ++ "$n" ++ t.suffix ++ "$n" ++ t.filter ++"} $n LIMIT 200 " ;  

QPWhichs t = t ;
QPHowMany t = t ;

QWh q p = {prop = q.type ; wh1 = "(count(distinct ?painting) as ?count)" ; 
     wh2 = case p.hasMaterial of {True => p.material ; 
           False => case p.hasMuseum of {True => p.museum ++ "$n" ++ p.filter ; 
           False =>  case p.hasSize of {True => p.size ; 
           False => case p.hasColor of {True => p.color ;  
           False => case p.hasYear of {True => p.year ;  
           False =>  "painting:createdBy ?author . "++ "$n" ++ "?author rdfs:label ?painter . " ++ p.filter }}}}}
           --False => p.filter}}}}}
  }  ;  

QThere q =  {prop = q.type ; wh1 = "(count(distinct ?painting) as ?count) " ; wh2 = q.prefix}  ;  


oper defEntry : {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = 
    {prefix = "rdfs:label ?title " ; 
     type = " ?painting rdf:type painting:Painting;" ; hasType = False ;
     material = "painting:hasMaterial ?material;" ; hasMaterial = False ;
     museum = "painting:hasCurrentLocation ?museum;" ; hasMuseum = False ;
     year = "painting:hasCreationDate ?date;" ; hasYear = False ;
     size = "painting:hasDimension ?dim ;" ; hasSize = False ; 
     color = "" ; hasColor = False ;  -- temporary change of color string to author
     suffix = "painting:createdBy ?author . ?author rdfs:label ?painter . $n ?date painting:toTimePeriodValue ?year . ?dim painting:lengthValue ?length ; $n painting:heightValue ?height . ?museum rdfs:label ?loc ." ;
     filter = "" }; 

oper  qAuthor : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \pp ->
     let df = defEntry in 
        {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = df.material ; hasMaterial = False ;
         museum = df.museum ; hasMuseum = False ;
         year = df.year ; hasYear = False ;
         size = df.size ; hasSize = False ;
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter ++ "$n" ++ "FILTER (str(?painter)=" ++  pp ++")"} ;

oper qTitle : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \ml ->
     let df = defEntry in 
        {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = df.material ; hasMaterial = False ;
         museum = df.museum ; hasMuseum = False ;
         year = df.year ; hasYear = False ; 
         size = df.size ; hasSize = False ; 
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter ++ "$n"  ++ "FILTER (str(?title)=" ++  ml ++")" ++ 
         "$n" ++ "FILTER (lang(?title) = 'en') "
         } ;


oper qMuseum : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \l -> 
     let df = defEntry in 
        {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = df.material ; hasMaterial = False ; 
         museum = df.museum ; hasMuseum = True ; 
         year = df.year ; hasYear = False ; 
         size = df.size ; hasSize = False ;
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter ++ "$n" ++  "FILTER (str(?loc)=" ++ l ++")"} ;  


oper qYear : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \l -> 
     let df = defEntry in 
        {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = df.material ; hasMaterial = False ; 
         museum = df.museum ; hasMuseum = False ; 
         year = df.year ; hasYear = True ; 
         size = df.size ; hasSize = False ;
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter ++ "$n" ++  "FILTER (str(?year)=" ++  l ++")"} ;  

oper qSize : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \l -> 
     let df = defEntry in 
        {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = df.material ; hasMaterial = False ; 
         museum = df.museum ; hasMuseum = False ; 
         year = df.year ; hasYear = False ; 
         size = df.size ; hasSize = True ;
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter ++ "$n" ++  "FILTER (str(?dim)=" ++  l ++")"} ; 

oper qColour : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \gold ->
     let df = defEntry in 
         {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = df.material ; hasMaterial = False ;
         museum = df.museum ; hasMuseum = False ;
         year = df.year ; hasYear = False ;
         size = df.size ; hasSize = False ;
         color = "painting:hasColor " ++ gold ++ ";" ; hasColor = True ; -- SEMI instead of .
         suffix = df.suffix ;
         filter = df.filter} ;

oper qMaterial : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \linen -> 
     let df = defEntry in 
        {prefix = df.prefix ; 
         type = df.type ; hasType = False ;
         material = "painting:hasMaterial  "++linen ++ " . " ; hasMaterial = True ;  --- NO ;; --
         museum = df.museum ; hasMuseum = False ;
         year = df.year ; hasYear = False ;
         size = df.size ; hasSize = False ;
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter} ;

oper qType : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \min -> 
     let df = defEntry in 
        {prefix = df.prefix ++ " ;"; 
         type = "?painting rdf:type " ++ min  ++ " "; hasType = True ; --SEMI 
         material = df.material ; hasMaterial = False ;
         museum = df.museum ; hasMuseum = False ;
         year = df.year ; hasYear = False ;
         size = df.size ; hasSize = False ;
         color = df.color ; hasColor = False ;
         suffix = df.suffix ;
         filter = df.filter} ;

oper qEType : Str -> {prefix : Str ; 
              type : Str ; hasType : Bool ;
              material : Str ; hasMaterial : Bool ;
              museum : Str ; hasMuseum : Bool ;
              year : Str ; hasYear : Bool ;
              size : Str ; hasSize : Bool ;
              color : Str ; hasColor : Bool ;
              suffix : Str ; 
              filter : Str} = \min -> 
     let df = defEntry in 
        {prefix = df.prefix ++ " ;"; 
         type = " ?painting rdf:type painting:Painting ; " ++ "$n" ; hasType = True ; 
         material =  ""  ; hasMaterial = False ; 
         museum =  df.museum  ; hasMuseum = False ; 
         year = df.year  ; hasYear = False ;
         size =  df.size ; hasSize = False ;
         color =  df.color  ; hasColor = False ;
         suffix =  df.suffix  ;
         filter = min ++ "$n" }; 

}
