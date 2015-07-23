module GPComment where
import Data.Binary
import GPUser
import Text.JSON.Generic

data Comment = Comm {
    cid :: Int,
    author :: TUser,
    text :: String } deriving Show


instance Binary Comment where
    put cm = do
        put (cid cm)
        put (author cm)
        put (text cm)

    get = do
        tCid <- get 
        tAuthor <- get
        tText <- get
        return (Comm tCid tAuthor tText)


instance JSON Comment where
    readJSON (JSObject jcom) = Ok $ Comm tCid tAuthor tText where
        tCid = vf jcom "id"
        tAuthor = Right (vf jcom "author_id")
        tText = vf jcom "text"

    showJSON = undefined