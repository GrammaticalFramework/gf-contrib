import Monad
import Idents
import SmultronFormat (readXML)
import HelperFuns

import PGF hiding (Tree,parse)
import Control.Monad
import System.Environment (getArgs)
import System.IO
import System.Process
import Data.Maybe
import Data.List
import Data.IORef
import Data.Char
import Data.Tree

test = False

main = do
  [pgf', xml'] <- getArgs
  pgf <- readPGF pgf'
  xml <- readXML xml'
  let Just language = readLanguage "TranslateEng"
      morpho        = buildMorpho pgf language
  ref <- newIORef (0,0,0)
  mapM_ (process pgf morpho ref) ((if test then take 40 else id) xml)
  where
    process pgf morpho ref t = do
      (cn,co,l) <- readIORef ref
      let e         = (flatten . parse smultron pgf morpho . prune) t
          (cn',co') = count (cn,co) e
          l'        = l+1
      writeIORef ref (cn',co',l')
      hPutStrLn stdout (showExpr [] e)
      when test $ do
        writeFile ("tmp_tree.dot") (graphvizAbstractTree pgf (True,False) e)
        rawSystem "dot" ["-Tpdf", "tmp_tree.dot", "-otrees/tree"++showAlign l'++".pdf"]
        return ()
      hPutStrLn stderr (show ((fromIntegral cn' / fromIntegral co') * 100))

    count (cn,co) e = cn `seq` co `seq`
      case unApp e of
        Just (f,es) -> if f == meta
                         then foldl' count (cn,  co+1) es
                         else foldl' count (cn+1,co+1) es
        Nothing     -> (cn+1,co+1)


    showAlign n =
      replicate (5 - length s) '0' ++ s
      where
        s = show n

    prune (Node tag ts)
      |   tag == "S" 
       && not (null ts)
       && last ts == Node "." [Node "." []] = Node tag (init ts)
      | otherwise                           = Node tag ts
      
    flatten e =
      case unApp e of
        Just (f,es) | f == meta -> mkApp f (concatMap grab es)
                    | otherwise -> mkApp f (map flatten es)
        Nothing                 -> e

    grab e =
      case unApp e of
        Just (f,es) | f == meta -> concatMap grab es
                    | otherwise -> [mkApp f (map flatten es)]
        Nothing                 -> []


smultron :: Grammar String Expr
smultron =
  grammar (mkApp meta) 
   [ "ADVP":-> do adv <- cat "RB"
                  case unApp adv of
                    Just (f,[a]) | f == cidPositAdvAdj -> return (mkApp cidPositAdVAdj [a])
                    _                                  -> mzero
               `mplus`
               do adV <- inside "RB" (lemma "AdV" "s")
                  return (mkApp adV [])
   , "ADJP":-> do adas <- many pAdA
                  v <- inside "JJ" (lemma "V2" "s VPPart")
                  pps <- many (cat "PP")
                  let adj  = mkApp cidPastPartAP [mkApp v []]
                      ap0  = foldr (\ada ap -> mkApp cidAdAP [ada,ap]) adj adas
                      ap   = foldr (\pp ap -> mkApp cidAdvAP [ap,pp]) ap0 pps
                  return ap
               `mplus`
               do adas0 <- many pAdA
                  adjs  <- many1 (cat "JJ")
                  let adj  = last adjs
                      adas = adas0 ++ [mkApp cidPositAdAAdj [adj] | adj <- init adjs]
                      ap   = foldr (\ada ap -> mkApp cidAdAP [ada,ap]) (mkApp cidPositA [adj]) adas
                  return ap
   , "S"   :-> do advs <- many $ do pp <- cat "PP"
                                    inside "," word
                                    return pp
                                 `mplus`
                                 do cat "ADVP"                  
                  e0 <- do (tmp,pol,sl,e) <- pClSlash
                           guard (not sl)
                           return (mkApp cidUseCl [tmp,pol,e])
                        `mplus`
                        do s <- cat "S"
                           inside "," word
                           np <- cat "NP"
                           inside "VP" $ do
                             (t,v) <- pV "VS"
                             inside "SBAR" $ do
                               cat "-NONE-"
                               inside "S" $ do
                                 cat "-NONE-"
                             return (mkApp cidUseCl [mkApp cidTTAnt [ mkApp (fromMaybe meta (isVTense t)) []
                                                                    , mkApp cidASimul []
                                                                    ]
                                                    ,mkApp cidPPos []
                                                    ,mkApp cidComplPredVP [np,mkApp cidComplVS [mkApp v [],s]]
                                                    ])
                  opt (inside "." word) ""
                  return (foldr (\ad e -> mkApp cidAdvS [ad, e]) e0 advs)
                `mplus`
                do s1 <- cat "S"
                   opt (inside "," word) ""
                   cc <- cat "CC"
                   s2 <- cat "S"
                   return (mkApp cidConjS [cc, mkApp cidBaseS [s1,s2]])
   , "SBAR" :-> do (do cat "-NONE-"    -- missing preposition
                       return ()
                    `mplus`
                    do w <- inside "IN" word
                       guard (w == "that"))
                   cat "S"
   , "NP"  :-> do (m_cc,list_np) <- pBaseNPs
                  case m_cc of
                    Just cc -> return (mkApp cidConjNP [cc, mkListNP list_np])
                    Nothing -> if length list_np > 1
                                 then return (mkApp meta list_np)
                                 else return (head list_np)
               `mplus`
               do np <- cat "NP"
                  rs <- inside "SBAR" $
                          do rp <- cat "WHNP"
                             inside "S" $
                               do (tmp,pol,sl,e) <- pClSlash
                                  guard sl
                                  return (mkApp cidUseRCl [tmp,pol,mkApp cidRelSlash [rp,e]])
                               `mplus`
                               do inside "NP" (cat "-NONE-")
                                  (tmp,pol,sl,vp) <- inside "VP" pVP
                                  guard (not sl)
                                  return (mkApp cidUseRCl [fromMaybe (mkApp meta []) (isVTense tmp)
                                                          ,mkApp pol []
                                                          ,mkApp cidRelVP [rp,vp]])
                  return (mkApp cidRelNP [np,rs])
               `mplus`
               do (m_cc,list_np) <- pNPs
                  case m_cc of
                    Just cc -> return (mkApp cidConjNP [cc, mkListNP list_np])
                    Nothing -> if length list_np > 1
                                 then return (mkApp meta list_np)
                                 else return (head list_np)
   , "VP"  :-> do (_,_,_,e) <- pVP
                  return e
   , "PP"  :-> do prep <- do cat "IN"
                          `mplus`
                          do inside "TO" word
                             return (mkApp cidto_Prep [])
                          `mplus`
                          do w1 <- inside "JJ" word
                             w2 <- inside "IN" word
                             guard (w1 == "such" && w2 == "as")
                             return (mkApp cidsuch_as_Prep [])
                  np   <- cat "NP"
                  return (mkApp cidPrepNP [prep,np])
               `mplus`
               do pp1 <- cat "PP"
                  inside "," word
                  conj <- cat "CC"
                  pp2 <- cat "PP"
                  opt (inside "," word) ""
                  return (mkApp cidConjAdv [conj, mkApp cidBaseAdv [pp1,pp2]])
   , "CC"  :-> do cc <- word
                  case cc of
                    "and" -> return (mkApp cidand_Conj [])
                    "&"   -> return (mkApp cidamp_Conj [])
                    "or"  -> return (mkApp cidor_Conj  [])
                    _     -> mzero
   , "DT"  :-> do (dt,b) <- pDT
                  return dt
   , "IN"  :-> do prep <- lemma "Prep" "s"
                  return (mkApp prep [])
   , "NN"  :-> do transform (concatMap splitDashN)
                  (do n <- lemma "N" "s Sg Nom" `mplus` lemma "N" "s Pl Nom"
                      (do inside "-" word
                          n2 <- lemma "N" "s Sg Nom"
                          return (mkApp cidDashCN [mkApp n [], mkApp n2 []])
                       `mplus`
                       do return (mkApp n [])))
               `mplus`
               do v <- lemma "V" "s VPresPart"
                  return (mkApp cidGerundN [mkApp v []])
   , "NNS" :-> do transform (concatMap splitDashN)
                  (do n <- lemma "N" "s Pl Nom"
                      return (mkApp n [])
                   `mplus`
                   do n1 <- lemma "N" "s Sg Nom"
                      inside "-" word
                      n2 <- lemma "N" "s Pl Nom"
                      return (mkApp cidDashCN [mkApp n1 [], mkApp n2 []]))
   , "PRP" :-> do p <- (lemma "Pron" "s (NCase Nom)"
                        `mplus`
                        lemma "Pron" "s NPAcc"
                        `mplus`
                        (do w <- word
                            guard (w == "I")   -- upper case word
                            return cidi_Pron))
                  return (mkApp p [])
   , "PRP$":-> do p <- lemma "Pron" "s (NCase Gen)"
                  return (mkApp cidPossPron [mkApp p []])
   , "RB"  :-> do a <- lemma "A" "s AAdv"
                  return (mkApp cidPositAdvAdj [mkApp a []])
               `mplus`
               do adv <- lemma "Adv" "s"
                  return (mkApp adv [])
   , "QP"  :-> do adn <- inside "IN" (lemma "AdN" "s")
                  num <- pCD
                  return (mkApp cidDetQuant [mkApp cidIndefArt [], mkApp cidNumCard [mkApp cidAdNum [mkApp adn [], num]]])
   , "WHNP":-> cat "WP"
               `mplus`
               cat "WDT"
               `mplus`
               cat "WP$"
               `mplus`
               do cat "-NONE-"
                  return (mkApp cidno_RP [])
               `mplus`
               do w <- inside "IN" word
                  guard (w == "that")
                  return (mkApp cidthat_RP [])
   , "-NONE-"
           :-> return (mkApp meta [])
   , "JJ"  :-> do a <- lemma "A" "s (AAdj Posit Nom)"
                  return (mkApp a [])
   , "JJR" :-> do a <- lemma "A" "s (AAdj Compar Nom)"
                  return (mkApp a [])
   , "JJS" :-> do a <- lemma "A" "s (AAdj Superl Nom)"
                  return (mkApp cidOrdSuperl [mkApp a []])
   , "VB"  :-> do v <- mplus (lemma "V" "s VInf")  (lemma "V2" "s VInf")
                  return (mkApp v [])
   , "VBD" :-> do v <- mplus (lemma "V" "s VPast") (lemma "V2" "s VPast")
                  return (mkApp v [])
   , "VBG" :-> do v <- mplus (lemma "V" "s VPresPart") (lemma "V2" "s VPresPart")
                  return (mkApp v [])
   , "VBN" :-> do v <- mplus (lemma "V" "s VPPart") (lemma "V2" "s VPPart")
                  return (mkApp v [])
   , "VBP" :-> do v <- mplus (lemma "V" "s VInf") (lemma "V2" "s VInf")
                  return (mkApp v [])
   , "VBZ" :-> do v <- mplus (lemma "V" "s VPres") (lemma "V2" "s VPres")
                  return (mkApp v [])
   , "PDT" :-> do pdt <- lemma "Predet" "s"
                  return (mkApp pdt [])
   , "WP"  :-> do rp <- (lemma "RP" "s (RC Masc (NCase Nom))"
                         `mplus`
                         lemma "RP" "s (RC Masc NPAcc)")
                  return (mkApp rp [])
   , "WDT" :-> do rp <- lemma "RP" "s (RC Neutr (NCase Nom))"
                  return (mkApp rp [])
   , "WP$" :-> do rp <- lemma "RP" "s (RC Masc (NCase Gen))"
                  return (mkApp rp [])
   ]
