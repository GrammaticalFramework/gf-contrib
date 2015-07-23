module GPUser where
import Data.Binary
-- import Text.JSON
import Text.JSON.Generic


type TUser = Either User Int -- by full user or id


data UserType
    = UAdmin
    | UInternal
    | UExternal
  deriving (Show, Eq)

instance JSON UserType where
    readJSON jut | ut `elem` [0..2] = Ok $ [UAdmin,UInternal,UExternal]!!ut
                 | otherwise        = Error $ "Invalid user type: " ++ show ut
      where Ok ut = fromJSON jut

    showJSON = undefined

instance Binary UserType where
    put UAdmin = put (0::Word8)
    put UInternal = put (1::Word8)
    put UExternal = put (2::Word8)

    get = get >>= dc where
        dc :: Word8 -> Get UserType
        dc t = return $ case t of
                            0 -> UAdmin
                            1 -> UInternal
                            2 -> UExternal

data User =
    PMUser {
        uid :: Int,
        name :: String,
        utype :: UserType,
        alias, email :: String
    } deriving Show

instance Eq User where
    ua == ub = uid ua == uid ub

instance JSON User where
    readJSON (JSObject juser) =
        case valFromObj "user" juser of
            Ok ju -> Ok $ PMUser {
                        uid = vf ju "id",
                        name = vf ju "name",
                        utype = vf ju "user_type",
                        alias = vf ju "alias",
                        email = vf ju "email" }
            Error e -> Error e 
    
    showJSON = undefined


instance Binary User where
    put u = do
        put (uid u)
        put (name u)
        put (utype u)
        put (alias u)
        put (email u)

    get = do
        lUid <- get
        lName <- get
        lUtype <- get
        lAlias <- get
        lEmail <- get
        return $ PMUser lUid lName lUtype lAlias lEmail



resolveUser :: [User] -> TUser -> User
resolveUser _ (Left u) = u
resolveUser us (Right n) =
    case lookup n [(uid u,u) | u <- us] of
        Just u -> u
        _      -> error $ "Cannot resolve user uid=" ++ show n 



-- JSON utils

vf :: JSON a => JSObject JSValue -> String -> a
vfm :: JSON a => JSObject JSValue -> String -> Maybe a
vfcatch :: JSON a => JSObject JSValue -> String -> (JSObject JSValue -> a) -> a
vfcatch job c f =
    case valFromObj c job of
        Ok v    -> v
        Error _ ->  f job
vf job c =
    case valFromObj c job of
        Ok v -> v
        Error e -> error $ "while decoding " ++ c ++ ": " ++ e
vfm job c =
    case valFromObj c job of
        Ok v -> Just v
        Error e -> Nothing