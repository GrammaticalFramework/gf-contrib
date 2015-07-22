module Transfer where
import Commands
import PGF (Tree, unApp, mkCId, mkApp, unDouble, mkInt)
import Data.Maybe (catMaybes, isJust)
import Data.List (nub)

data Message
    = NoParse
    | Msg String
    | EvalReturn Tree String
    | EvalSimple Tree String
    | Ambiguous [(String,Tree)]
  deriving Show



-- what to Answer the user whether Sage returned somethin or none.

completeEmpty  :: Bool -> Tree -> Maybe Tree
completeReturn :: Bool -> Tree -> [Tree] -> [Tree]

completeEmpty False _ = Nothing
completeEmpty True question = Just $ gf $
    case fg question of
        GAssign k var value -> GAssigned k var value
        GAssert p           -> GAsserted p
    
completeReturn feedback question answers = catMaybes $ map (comp' . fg) answers
  where
    comp' = comp (fg question)
    comp g a@(GYesApprox _)  = Just (gf a)
    comp g a@GNo             = Just (gf a)
    comp g a@GYes            = Just (gf a)
    comp g a@(GSimple k v2)  =
        case value g of
            Just v1 -> Just $ gf $ if feedback
                                then (GFeedBack k v1 v2)
                                else a
            _       -> Nothing
    comp _ a@(GBegunBlock _)     = Just (gf a)
    comp _ a@(GEndedBlock _)     = Just (gf a) 
    comp _ _ = Nothing
    value (GCompute _ v)       = Just v
    value (GApproximate v)     = Just $ GfromNum v
    value (GApproximateTo v _) = Just $ GfromNum v
    value _                    = Nothing


dispatch t lint =
    case fg t of
        GAssign _ _ _  -> EvalSimple t lint
        GAssert _      -> EvalSimple t lint
        _              -> EvalReturn t lint
        

computed_tf feedback k rval trees =
    map (gf . (linAs feedback)) [v | t <- trees, GSimple k v <- [fg t]]
  where
    linAs True v  = GFeedBack k rval v
    linAs False v = GSimple k v
    


-- purge overgenerating parsings by
-- removing float literals that are in fact integer literals
purgeFloats :: [Tree] -> [Tree]
purgeFloats ts = (nub . catMaybes . map purge) ts where
  purge :: Tree -> Maybe Tree
  purge t = case unApp t of
    Just (i, [x]) | i == mkCId "float2num" ->
        case unDouble x of
            Just r -> if isInfinite r
                        then Nothing -- remove Infinity (it is a Double) 
                        else
                            let (n,f) = properFraction r
                            in if f == 0
                                then Just $ mkApp (mkCId "int2num") [mkInt n]
                                else Just $ t
            _      -> error "no double"
    Just (i, xs)                          -> let pxs =  map purge xs
                                             in if all isJust pxs
                                                then Just $ mkApp i (catMaybes pxs)
                                                else Nothing
    _                                     -> Just t


purgeRationals :: [Tree] -> [Tree]
purgeRationals ts = (nub . map pRat) ts where
    pRat t = case getValNum t of
                Left num -> gf (mkRatLit  num)
                Right t -> purgeArgs t
    purgeArgs t = case unApp t of
                    Just (i,xs) -> mkApp i $ map pRat xs
                    Nothing     -> t
    mkRatLit :: GValNum -> GValNum
    getValNum :: Tree -> Either GValNum Tree
    getValNum t = case unApp t of
                    Just (i,[n,d]) | show i `elem` ratForms
                            -> Left (fg t)
                    _       -> Right t
    ratForms = words "quotient divide bin_over"
    mkRatLit g = case g of
        Gbin_over n d -> rat n d
        Gdivide n d -> rat n d
        Gquotient n d ->  rat n d
        _             -> g
      where
        rat n d = maybe g id (mk n d)
        mk n d =  case (mkIntLit n, mkIntLit d) of
            (Just gn, Just gd) -> Just $ Gnums1_rational gn gd
            _                  -> Nothing


mkIntLit :: GValNum -> Maybe GValNum
mkIntLit i@(Gint2num _)          = Just i
mkIntLit (Gfloat2num (GFloat r)) = 
    if isInfinite r 
        then Nothing
        else let (n,f) = properFraction r
             in if f == 0
                    then Just $ Gint2num (GInt n)
                    else Nothing
mkIntLit _            = Nothing

{-
paraphrasePower:: Tree -> Tree
--paraphrasePower (Gpower x (Gint2num (GInt 2))) = Gpower2 x
--paraphrasePower (Gpower x (Gint2num (GInt 3))) = Gpower3 x
paraphrasePower t =
    case getPower t of
        Just (Gpower x (Gint2num (GInt n)))
                -> case n of 
			2 -> Gpower2 x
			3 -> Gpower3 x	
                        _ -> Gpower x (Gint2num (GInt n))      
  where                     
    getPower :: Tree -> Maybe GValNum
    getPower t = case unApp t of
        Just (i,[v,f]) | i == mkCId "power"
                -> Just $ fg t
        _       -> Nothing

-}

reduceLambda :: Tree -> Tree
reduceLambda t =
    case getLambda t of
        Just (Glambda v (GAt f (GVar2Num u)))
                -> if gf u == gf v && isnamed f
                    then gf f
                    else reduceArgs t
        _       -> reduceArgs t
  where
    isnamed :: GValFun -> Bool
    isnamed f = case unApp (gf f) of
                    Just (_,[]) -> True
                    _           -> False
    reduceArgs t = case unApp t of
        Just (i,xs)  -> mkApp i $ map reduceLambda xs
        Nothing      -> t
    getLambda :: Tree -> Maybe GValFun
    getLambda t = case unApp t of
        Just (i,[v,f]) | i == mkCId "lambda"
                -> Just $ fg t
        _       -> Nothing
