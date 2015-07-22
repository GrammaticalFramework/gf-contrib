module GfSide where
import PGF
import Transfer
import Data.Char
import Data.List (nub)
import Data.Map (keys)
#ifdef VOICED
import Voice hiding (Language)
#else
type Voice = String
#endif

#ifdef VOICED
getVoices :: GfCx -> IO [Voice]
getVoices cx = availableVoices isoLang2
  where
    (_,_,lang) = tp2 cx
    isoLang2 = (toISOLang2 . reverse . take 3 . reverse . show) lang
#endif




type TransPair = (Type,Language,Language)
data GfCx = GfC {
    pgf :: PGF, 
    tp1,tp2 :: TransPair,
    voice :: Maybe Voice,
    lastExp :: Tree,
    feedback :: Bool,
    gverbosity :: Int}

toCat :: String -> Type
toCat cat = mkType [] (mkCId cat) []

mkGfCx :: FilePath -> IO GfCx
mkGfCx path = do
    pgf <- readPGF path
    let 
        gf0 = GfC pgf undefined undefined Nothing undefined False 3
        cat = startCat pgf
        sage = mkLang gf0 "sage"
        eng = mkLang gf0 "english"
        tp1 = (toCat "Command", eng, sage)
        tp2 = (toCat "Answer", sage, eng)
    return $ gf0 {tp1 = tp1, tp2 = tp2 } -- GfC pgf tp1 tp2 Nothing undefined False



mkLang :: GfCx -> String -> Language
mkLang gf lang = 
    case [lg | lg <- languages (pgf gf), matchSuffix (toISOLang lang) (show lg)] of
        []    -> error $ "Language " ++ lang ++ " not found"
        (c:_) -> c
  where
    matchSuffix s t = reverse s == take (length s) (reverse t)
    toISOLang "sage"     = "Sage"
    toISOLang "romanian" = "Ron"
    toISOLang (c:cs)     = (toUpper c):(take 2 cs)
    
    
             
nparse :: PGF -> TransPair -> String -> [Tree]
nlin   :: PGF -> TransPair -> Tree -> String

nparse pgf (cat,l1,_) input = nub (parse pgf l1 cat input)
nlin pgf (_,_,l2) = linearize pgf l2

       
fcomp gf n (left,right) =
    case loop state0 ws of
        Nothing    -> (left,[])
        Just state -> let compls = getCompletions state pre
                      in (drop (length pre) left, keys compls)
 where
        (cat,lang,_) = tp1 gf
        (rpre,rs) = break isSpace left
        pre = reverse rpre
        s  = reverse rs
        ws = words s
        state0 = initState (pgf gf) lang cat
        loop ps []     = Just ps
        loop ps (w:ws) =
            case nextState ps (simpleParseInput w) of
                Left _   -> Nothing
                Right ps -> loop ps ws
                
                
parse1 cx  = (nparse (pgf cx) (tp1 cx)) . lexerDash
lin1 cx = nlin (pgf cx) (tp1 cx)


parse2 cx  = (nparse (pgf cx) (tp2 cx)) . lexer . unquote where
    unquote ('\'':cs) | last cs == '\'' = init cs
    unquote cs = cs

lin2 cx = nlin (pgf cx) (tp2 cx) 



mkAmbiguous lin ts = Ambiguous $ map (\t -> (unlexerDash (lin t), t)) ts


pass1 :: GfCx -> String -> IO Message
pass1 cx uinput = do
    let parsed = parse1 cx uinput
    vpTrees "1 PARSED" 4 parsed
    let purged = purgeFloats parsed
        computed = map (compute (pgf cx)) purged
    vpTrees "1 COMPUTED" 4 computed
    case computed of
            []  -> return NoParse
            [t] -> pass1' cx t
            ts  -> return $ mkAmbiguous (lin1 cx) ts
  where
    paction f n | n <= gverbosity cx = f
    paction _ _ | otherwise = \_ -> return ()
    vpTrees name = paction (\ts -> putStrLn (name ++ ":") >> mapM_ (\t -> putStrLn $ " " ++ showExpr [] t) ts)
    
    
            
            
pass1' :: GfCx -> Tree -> IO Message
pass1' cx tree = return $ dispatch tree (lin1 cx tree)
            

pass2 :: GfCx -> String -> IO Message
pass2 cx [] = return $ 
    case completeEmpty (feedback cx) (lastExp cx) of
        Nothing -> Msg []
        Just t  -> Msg $ lin2 cx t
pass2 cx result = do
        let parsed = parse2 cx result
        vpTrees "2 PARSED" 4 parsed
        let computed = nub $ (map reduceLambda) . compute2 . purgeFloats . purgeRationals $ parsed
        vpTrees "2 COMPUTED" 4 computed
        return $ case computed of
            []  ->  NoParse
            ts  -> case completeReturn (feedback cx) (lastExp cx) computed of
                    []  -> error $ "No parsing after completion: " ++ result
                    [t] -> Msg (unlexerDash (lin2 cx t))
                    ts  -> mkAmbiguous (lin2 cx) $ take 10 ts  -- Combinatorial explosion: pick only the first 10
  where
    compute2 = map (compute (pgf cx))
    paction f n | n <= gverbosity cx = f
    paction _ _ | otherwise = \_ -> return ()
    vpTrees name = paction (\ts -> putStrLn (name ++ ":") >> mapM_ (\t -> putStrLn $ " " ++ showExpr [] t) ts)
                    
                                
    
lexer = unwords . lexCode
    -- Copied from Text/Lexing.hs
    -- | Haskell lexer, usable for much code

lexCode :: String -> [String]
lexCode ss = case lex ss of
    [(w@(_:_),ws)] -> w : lexCode ws
    _ -> []
        
        
lexerDash = unwords . dashGlue . lexCode where
    dashGlue [] = []
    dashGlue (a:"-":b:cs) | isWord a && isWord b = (a ++ "-"  ++ b):(dashGlue cs)
    dashGlue (c:cs) = c:(dashGlue cs)
    isWord = all isAlpha

unlexerDash :: String -> String
unlexerDash = unwords . gluePunctuation . words where
    gluePunctuation = reverse . g . reverse
    g :: [String] -> [String]
    g ([p]:(w:ws)) | isPunctuation p = (w++[p]):ws
    g ws = ws

{-
unlexerDash = unwords . addFinalPunct . tokens where 
    addFinalPunct [] = []
    addFinalPunct cs = take (length cs -1) cs ++ [last cs ++ "."] --we assume the punctuation of an answer is always "."  

tokens :: String -> [String]
tokens =  removeLast . map (lower . nopunc) . words 
    where
      lower   = map toLower
      nopunc  = strip isPunctuation
      strip p = reverse . dropWhile p . reverse
      removeLast  = reverse . tail . reverse
-}


checkGf :: GfCx -> IO () 
checkGf gf = if null invalidLangs
                then return ()
                else error $ "No available languages: " ++ (unwords $ map show invalidLangs)
  where
    allLangs = nub $ (langs $ tp1 gf) ++ (langs $ tp2 gf)
    langs (_,l1,l2) = [l1,l2]
    validLangs = languages $ pgf gf
    invalidLangs  = filter (not . (`elem` validLangs)) allLangs
    
    
sayAnswer gf alternate =
#ifdef VOICED
    case voice gf  of
        Just v -> (\s -> say v s)
        _      -> alternate
#else
    alternate
#endif
