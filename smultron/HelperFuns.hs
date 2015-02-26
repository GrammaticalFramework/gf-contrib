module HelperFuns where

import Monad
import Idents
import SmultronFormat

import PGF hiding (Tree,parse)
import Control.Monad
import System.IO
import System.Process
import Data.Maybe
import Data.List
import Data.IORef
import Data.Char
import Data.Tree

-- | Helper functions for ConvertEng. Taken directly from 
-- http://www.grammaticalframework.org/treebanks/PennTreebank/translate.hs
-- Some of them could probably be used for other languages too?
 

data VForm a
  = VInf | VPart | VGerund | VTense a

instance Functor VForm where
  fmap f VInf       = VInf
  fmap f VPart      = VPart
  fmap f VGerund    = VGerund
  fmap f (VTense t) = VTense (f t)

isVInf VInf = True
isVInf _    = False

isVPart VPart = True
isVPart _     = False

isVGerund VGerund = True
isVGerund _       = False

isVTense (VTense t) = Just t
isVTense _          = Nothing


pVP = do
  (t,a,p,sl,e0) <- do t <- pCopula
                      p <- pPol
                      inside "VP" $ do
                        advs <- many (cat "ADVP")
                        (t',p',sl,e0) <- pVP
                        guard (isVPart t' && sl && p' == cidPPos)
                        let e1 = mkApp cidPassVPSlash [e0]
                            e2 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e1 advs
                        return (t,cidASimul,p,False,e2)
                   `mplus`
                   do t <- pCopula
                      p <- pPol
                      advs <- many (cat "ADVP")
                      e <- do e <- cat "ADJP"
                              return (mkApp cidCompAP [e])
                           `mplus`
                           do e <- cat "NP"
                              return (mkApp cidCompNP [e])
                           `mplus`
                           do e <- cat "NP"
                              return (mkApp cidCompNP [e])
                           `mplus`
                           do e <- cat "PP"
                              return (mkApp cidCompAdv [e])
                           `mplus`
                           do e <- cat "SBAR"       
                              return (mkApp cidCompS [e])
                           `mplus`
                           do e <- inside "S" $ do
                                      inside "NP" (cat "-NONE-")
                                      (tmp,pol,sl,e) <- inside "VP" pVP
                                      guard (isVInf tmp && not sl && pol == cidPPos)
                                      return e
                              return (mkApp cidCompVP [e])
                      let e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) (mkApp cidUseComp [e]) advs
                      return (t,cidASimul,p,False,e1)
                   `mplus`
                   do t <- pCopula
                      p <- pPol
                      advs <- many (cat "ADVP")
                      (tmp,pol,sl,e) <- inside "VP" pVP
                      guard (isVGerund tmp && not sl && pol == cidPPos)
                      let e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e advs
                      return (t,cidASimul,p,False,mkApp cidProgrVP [e1])
                   `mplus`
                   do t <- pCopula
                      p <- pPol
                      adv <- cat "ADVP"
                      return (t,cidASimul,p,False,mkApp cidUseComp [mkApp cidCompAdv [adv]])
                   `mplus`
                   do w <- inside "MD" word
                      t <- case w of
                             "will"  -> return cidTFut
                             "would" -> return cidTCond
                             _       -> mzero
                      p <- pPol
                      advs <- many (cat "ADVP")
                      (tmp,pol,sl,e0) <- inside "VP" pVP
                      guard (isVInf tmp && pol == cidPPos)
                      let e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (VTense t,cidASimul,p,sl,e1)
                   `mplus`
                   do t <- pHave
                      p <- pPol
                      advs   <- many (cat "ADVP")
                      (tmp,pol,sl,e0) <- inside "VP" pVP
                      guard (isVPart tmp && pol == cidPPos)
                      let e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (t,cidAAnter,p,sl,e1)
                   `mplus`
                   do t <- pDo
                      p <- pPol
                      advs <- many (cat "ADVP")
                      (tmp,p',sl,e0) <- inside "VP" $ pVP
                      guard (p' == cidPPos)
                      let e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (t,cidASimul,p,sl,e1)
                   `mplus`
                   do advs <- many (cat "ADVP")
                      inside "TO" word                        -- infinitives
                      e0 <- cat "VP"
                      let e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (VInf,cidASimul,cidPPos,False,e1)
                   `mplus`
                   do advs1 <- many (cat "ADVP")
                      (t,v) <- pV "V2"
                      pps   <- many (cat "PP")
                      let e0 = mkApp cidSlashV2a [mkApp v []]
                          e1 = foldl (\e pp -> mkApp cidAdvVPSlash [e, pp]) e0 pps
                      (sl,e2) <- (do (inside "NP" (cat "-NONE-")
                                      `mplus`
                                      inside "SBAR" (cat "-NONE-"))
                                     return (True,e1)
                                  `mplus`
                                  do np <- cat "NP"
                                     return (False,mkApp cidComplSlash [e1, np]))
                      let e3 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e2 advs1
                      return (t,cidASimul,cidPPos,sl,e3)
                   `mplus`
                   do (t,v) <- inside "MD" $
                                 (do v <- lemma "VV" "s (VVF VPres)"
                                     return (cidTPres,v)
                                  `mplus`
                                  do v <- lemma "VV" "s (VVF VPast)"
                                     return (cidTPast,v))
                      p <- pPol
                      advs <- many (cat "ADVP")
                      vp <- cat "VP"
                      let e0 = mkApp cidComplVV [mkApp v [], vp]
                          e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (VTense t,cidASimul,p,False,e1)
                   `mplus`
                   do advs <- many (cat "ADVP")
                      (t,v) <- pVV
                      vp    <- inside "S" $ do
                                  inside "NP" (cat "-NONE-")
                                  (tmp,pol,sl,e) <- inside "VP" pVP
                                  guard ((isVInf tmp || isVGerund tmp) && not sl && pol == cidPPos)
                                  return e
                      let e0 = mkApp cidComplVV [mkApp v [], vp]                          
                          e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (t,cidASimul,cidPPos,False,e1)
                   `mplus`
                   do advs <- many (cat "ADVP")
                      (t,v) <- pV "V2V"
                      inside "S" $ 
                        (do inside "NP" (cat "-NONE-")
                            (tmp,pol,sl,vp) <- inside "VP" pVP
                            guard (isVInf tmp && not sl)
                            let e0 = mkApp cidSlashV2V [mkApp v [], mkApp pol [], vp]
                                e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                            return (t,cidASimul,cidPPos,True,e1)
                         `mplus`
                         do np <- cat "NP"
                            (tmp,pol,sl,vp) <- inside "VP" pVP
                            guard (isVInf tmp && not sl)
                            let e0 = mkApp cidComplSlash [mkApp cidSlashV2V [mkApp v [], mkApp pol [], vp], np]
                                e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                            return (t,cidASimul,cidPPos,False,e1))
                   `mplus`
                   do advs <- many (cat "ADVP")
                      (t,v) <- pV "VA"
                      adjp  <- cat "ADJP"
                      let e0 = mkApp cidComplVA [mkApp v [], adjp]
                          e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (t,cidASimul,cidPPos,False,e1)
                   `mplus`
                   do advs <- many (cat "ADVP")
                      (t,v) <- pV "VS"
                      s     <- cat "S" `mplus` cat "SBAR"
                      let e0 = mkApp cidComplVS [mkApp v [], s]
                          e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (t,cidASimul,cidPPos,False,e1)
                   `mplus`
                   do advs <- many (cat "ADVP")
                      (t,v) <- pV "V"
                      let e0 = mkApp cidUseV [mkApp v []]
                          e1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) e0 advs
                      return (t,cidASimul,cidPPos,False,e1)
  pps <- many (cat "PP"
               `mplus`
               inside "ADVP" (cat "RB"))
  let tmp = fmap (\t -> mkApp cidTTAnt [mkApp t [],mkApp a []]) t
      e1  = foldl (\e pp -> mkApp (if sl then cidAdvVPSlash else cidAdvVP) [e, pp]) e0 pps
  return (tmp, p, sl, e1)

pClSlash = do np <- cat "NP"
              advs <- many (cat "ADVP")
              (tmp,pol,sl,vp) <- do (tmp,pol,sl,vp) <- inside "VP" pVP
                                    return (isVTense tmp,pol,sl,vp)
                                 `mplus`
                                 do vp <- cat "VP"
                                    return (Nothing,meta,False,vp)
              let vp1 = foldr (\pp e -> mkApp cidAdVVP [pp, e]) vp advs
              return (fromMaybe (mkApp meta []) tmp
                     ,mkApp pol []
                     ,sl
                     ,mkApp (if sl then cidSlashVP else cidPredVP) [np,vp1]
                     )

pV cat =
  do v <- lookup "VB" "s VInf"
     return (VInf,v)
  `mplus`
  do v <- lookup "VBP" "s VInf"
     return (VTense cidTPres,v)
  `mplus`
  do v <- lookup "VBZ" "s VPres"
     return (VTense cidTPres,v)
  `mplus`
  do v <- lookup "VBD" "s VPast"
     return (VTense cidTPast,v)
  `mplus`
  do v <- lookup "VBN" "s VPPart"
     return (VPart,v)
  `mplus`
  do v <- lookup "VBG" "s VPresPart"
     return (VGerund,v)
  where
    lookup pos fld = 
       inside pos $
         (do lemma cat fld
          `mplus`
          do w <- word
             return (mkCId ("["++w++"_"++cat++"]")))

pVV =
  do v <- lookup "VB" "s (VVF VInf)"
     return (VInf,v)
  `mplus`
  do v <- lookup "VBP" "s (VVF VInf)"
     return (VTense cidTPres,v)
  `mplus`
  do v <- lookup "VBZ" "s (VVF VPres)"
     return (VTense cidTPres,v)
  `mplus`
  do v <- lookup "VBD" "s (VVF VPast)"
     return (VTense cidTPast,v)
  `mplus`
  do v <- lookup "VBN" "s (VVF VPPart)"
     return (VPart,v)
  `mplus`
  do v <- lookup "VBG" "s (VVF VPresPart)"
     return (VGerund,v)
  where
    lookup pos fld = 
       inside pos $
         (do lemma "VV" fld
          `mplus`
          do w <- word
             return (mkCId ("["++w++"_VV]")))

pCopula =
  do s <- inside "VB" word
     guard (s == "be")
     return VInf
  `mplus`
  do s <- inside "VBP" word
     guard (s == "am" || s == "'m" || s == "are" || s == "'re")
     return (VTense cidTPres)
  `mplus`
  do s <- inside "VBZ" word
     guard (s == "is" || s == "'s")
     return (VTense cidTPres)
  `mplus`
  do s <- inside "VBD" word
     guard (s == "were" || s == "was")
     return (VTense cidTPast)
  `mplus`
  do s <- inside "VBN" word
     guard (s == "been")
     return VPart
  `mplus`
  do s <- inside "VBG" word
     guard (s == "being")
     return VGerund

pDo =
  do s <- inside "VB" word
     guard (s == "do")
     return VInf
  `mplus`
  do s <- inside "VBP" word
     guard (s == "do")
     return (VTense cidTPres)
  `mplus`
  do s <- inside "VBZ" word
     guard (s == "does")
     return (VTense cidTPres)
  `mplus`
  do s <- inside "VBD" word
     guard (s == "did")
     return (VTense cidTPast)

pHave =
  do s <- inside "VB" word
     guard (s == "have")
     return VInf
  `mplus`
  do s <- inside "VBP" word
     guard (s == "have")
     return (VTense cidTPres)
  `mplus`
  do s <- inside "VBZ" word
     guard (s == "has")
     return (VTense cidTPres)
  `mplus`
  do s <- inside "VBD" word
     guard (s == "had")
     return (VTense cidTPast)
  `mplus`
  do s <- inside "VBN" word
     guard (s == "had")
     return VPart

pPol =
  do w <- inside "RB" word
     guard (w == "n't" || w == "not")
     return cidPNeg
  `mplus`
  do return cidPPos

pBaseNP = 
  do np <- inside "NN" (lemma "NP" "s (NCase Nom)")
     return (mkApp np [])
  `mplus`
  do m_pdt <- opt (liftM Just (cat "PDT")) Nothing
     m_q   <- opt (liftM Just pQuant) Nothing
     m_num <- opt (liftM Just pCD   ) Nothing
     m_ord <- opt (liftM Just (cat "JJS")) Nothing
     adjs  <- many pModCN
     ns    <- many1 (mplus (cat "NN"  >>= \n -> return (n,cidNumSg)) 
                           (cat "NNS" >>= \n -> return (n,cidNumPl)))
     let (n,s) = last ns
         cn0   = foldr (\(n,s) e -> mkApp cidCompoundCN [mkApp s [], n, e])
                       (mkApp cidUseN [n])
                       (init ns)
         cn    = foldr (\adj e -> mkApp cidAdjCN [adj, e]) 
                       cn0
                       adjs
         num   = maybe (mkApp s []) (\n -> mkApp cidNumCard [n]) m_num
         
         mkDetQuant q num =
           case m_ord of
             Just ord -> mkApp cidDetQuantOrd [q,num,ord]
             Nothing  -> mkApp cidDetQuant    [q,num]

     e0 <- if s == cidNumSg
             then case m_q of
                    Just (q,True)  -> return (mkApp cidDetCN [mkDetQuant q num,cn])
                    Just (q,False) -> return (mkApp cidDetCN [q,cn])
                    Nothing        -> do guard (isNothing m_num)
                                         return (mkApp cidMassNP [cn])
             else case m_q of
                    Just (q,True)  -> return (mkApp cidDetCN [mkDetQuant q num,cn])
                    Just (q,False) -> return (mkApp cidDetCN [q,cn])
                    Nothing        -> return (mkApp cidDetCN [mkDetQuant (mkApp cidIndefArt []) num,cn])
     let e1 = case m_pdt of
                Just pdt -> mkApp cidPredetNP [pdt,e0]
                Nothing  -> e0
     return e1
  `mplus`
  do dt <- cat "QP"
     n  <- mplus (cat "NN") (cat "NNS")
     return (mkApp cidDetCN [dt,mkApp cidUseN [n]])
  `mplus`
  do m_q <- opt (liftM Just pQuant) Nothing
     ws2 <- many1 (inside "NNP" word `mplus` inside "NNPS" word)
     let e0 = mkApp cidSymbPN
                    [mkApp cidMkSymb 
                           [mkStr (unwords ws2)]]
     case m_q of
       Just (q,b) -> do guard b
                        return (mkApp cidUseQuantPN [q,e0])
       Nothing    -> return (mkApp cidUsePN      [e0])
  `mplus`
  do p <- inside "PRP" (lemma "NP" "s (NCase Nom)")
     return (mkApp p [])
  `mplus`
  do p <- cat "PRP"
     return (mkApp cidUsePron [p])
  `mplus`
  do np   <- cat "NP"
     pps  <- many1 (cat "PP")
     prns <- many  (cat "PRN")
     let e0 = foldl (\e pp -> mkApp cidAdvNP [e, pp]) np pps
         e1 = foldl (\e pn -> mkApp meta     [e, pn]) e0 prns
     return e1
  `mplus`
  do np <- cat "NP"
     inside "," word
     (t',p',sl,vp) <- inside "VP" pVP
     guard (isVPart t' && sl && p' == cidPPos)
     inside "," word
     return (mkApp meta [np, vp])
  `mplus`
  do (q,b) <- pQuant
     return (mkApp cidDetNP [if b
                               then mkApp cidDetQuant [mkApp cidIndefArt [],mkApp cidNumSg []]
                               else q])
  `mplus`
  do n <- pCD
     return (mkApp cidDetNP [mkApp cidDetQuant [mkApp cidIndefArt [],mkApp cidNumCard [n]]])

pBaseNPs = do
  np <- pBaseNP
  (do inside "," word
      (m_cc,nps) <- pBaseNPs
      return (m_cc   ,np:nps)
   `mplus`
   do cc  <- cat "CC"
      np2 <- pBaseNP
      return (Just cc,[np,np2])
   `mplus`
   do return (Nothing,[np]))

pNPs = do
  (t1,t2) <- do w <- inside "DT" word
                case map toLower w of
                  "both"   -> return (mkApp cidand_Conj [],mkApp cidboth7and_DConj [])
                  "either" -> return (mkApp cidor_Conj [],mkApp cideither7or_DConj [])
                  _        -> mzero
             `mplus`
             do return (mkApp meta [],mkApp meta [])
  (m_cc,nps) <- pList
  return (fmap (toDConj t1 t2) m_cc,nps)
  where
    toDConj t1 t2 cc
      | cc == t1  = t2
      | otherwise = cc

    pList = do
      np <- cat "NP"
      (do inside "," word
          (m_cc,nps) <- pList
          return (m_cc   ,np:nps)
       `mplus`
       do cc  <- cat "CC"
          np2 <- cat "NP"
          return (Just cc,[np,np2])
       `mplus`
       do return (Nothing,[np]))

mkListNP nps0 =
  foldr (\np1 np2 -> mkApp cidConsNP [np1,np2]) (mkApp cidBaseNP nps2) nps1
  where
    (nps1,nps2) = splitAt (length nps0-2) nps0

pModCN =
  do v <- inside "VBN" (lemma "V2" "s VPPart")
     return (mkApp cidPastPartAP [mkApp v []])
  `mplus`
  do v <- inside "JJ" (lemma "V2" "s VPPart")
     return (mkApp cidPastPartAP [mkApp v []])
  `mplus`
  do v <- inside "JJ" (lemma "V" "s VPresPart")
     return (mkApp cidGerundAP [mkApp v []])
  `mplus`
  do a <- cat "JJ"
     return (mkApp cidPositA [a])
  `mplus`
  do a <- cat "ADJP"
     return a

pCD = 
  do w0 <- inside "CD" word
     let w = filter (/=',') w0
     guard (not (null w) && all isDigit w)
     let es = [mkApp (mkCId ("D_"++[d])) [] | d <- w]
         e0 = foldr (\e1 e2 -> mkApp cidIIDig [e1,e2]) (mkApp cidIDig [last es]) (init es)
         e1 = mkApp cidNumDigits [e0]
     return e1
  `mplus`
  do w <- inside "CD" word
     e <- case map toLower w of
            "one"   -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot01 []]]]])
            "two"   -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn2 []]]]]])
            "three" -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn3 []]]]]])
            "four"  -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn4 []]]]]])
            "five"  -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn5 []]]]]])
            "six"   -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn6 []]]]]])
            "seven" -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn7 []]]]]])
            "eight" -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn8 []]]]]])
            "nine"  -> return (mkApp cidnum [mkApp cidpot2as3 [mkApp cidpot1as2 [mkApp cidpot0as1 [mkApp cidpot0 [mkApp cidn9 []]]]]])
            _       -> mzero
     return (mkApp cidNumNumeral [e])
  `mplus`
  do cat "CD"

pQuant =
  inside "DT" pDT
  `mplus`
  do dt <- cat "PRP$"
     return (dt,True)
  `mplus`
  do np <- inside "NP" $ do
             np <- pBaseNP
             inside "POS" word
             return np
     return (mkApp cidGenNP [np],True)
  `mplus`
  do dt <- pMany
     return (dt,False)

pDT =
  do dt <- mplus (lemma "Quant" "s False Sg")
                 (lemma "Quant" "s False Pl")
     return (mkApp dt [],True)
  `mplus`
  do dt <- lemma "Det" "s"
     return (mkApp dt [],False)

pMany =
  do w <- inside "JJ" word
     guard (map toLower w == "many")
     return (mkApp cidmany_Det [])

pAdA = do adv <- cat "RB"
          case unApp adv of
            Just (f,[a]) | f == cidPositAdvAdj 
                   -> return (mkApp cidPositAdAAdj [a])
            _      -> mzero
       `mplus`
       do ada <- inside "RB" (lemma "AdA" "s")
          return (mkApp ada [])

splitDashN (Node w []) =
  case break (=='-') w of
    (w1,'-':w2) -> Node w1 [] : Node "-" [Node "-" []] : splitDashN (Node w2 [])
    _           -> [Node w []]
splitDashN t = [t]

meta = mkCId "?"
