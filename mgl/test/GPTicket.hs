module GPTicket where
import GPUser
import GPComment (Comment)
import Data.Binary
import Text.JSON.Generic

type Priority = Int

newtype Tag = PMTag String deriving (Show, Eq)

instance JSON Tag where
    readJSON (JSObject jtag) =
        case valFromObj "name" jtag of
            Ok tag  -> Ok $ PMTag tag
            Error e -> Error e
    
    showJSON = undefined

instance Binary Tag where
    put (PMTag s) = put s

    get = get >>= (\s -> return $ PMTag s)

data TicketStatus
    = TSopen
    | TSassigned
    | TScompleted
    | TSwontFix
    | TScantReproduce
    | TSduplicate
  deriving Eq

tsCode :: TicketStatus -> Char
tsCode TSopen         = 'O'
tsCode TSassigned     = 'A'
tsCode TScompleted     = '.'
tsCode TSwontFix       = '!'
tsCode TScantReproduce = '?'
tsCode TSduplicate     = '&'


instance Show TicketStatus where
    show TSopen          = "open"
    show TSassigned      = "assigned"
    show TScompleted     = "completed"
    show TSwontFix       = "won't fix"
    show TScantReproduce = "can't reproduce"
    show TSduplicate     = "duplicated"

instance Binary TicketStatus where
    put TSopen     = put (0::Word8)
    put TSassigned = put (1::Word8)
    put TScompleted = put (2::Word8)
    put TSwontFix = put (3::Word8)
    put TScantReproduce = put (4::Word8)
    put TSduplicate = put (5::Word8)

    get = get >>= toTS where
        toTS :: Word8 -> Get TicketStatus
        toTS t = return $ case t of
                            0 -> TSopen
                            1 -> TSassigned
                            2 -> TScompleted
                            3 -> TSwontFix
                            4 -> TScantReproduce
                            5 -> TSduplicate


data Ticket = PMTicket {
    cid :: Int,
    author :: TUser, 
    title :: String,
    tstatus :: TicketStatus,
    description :: String,
    priority :: Int,
    assignee :: Maybe TUser,
    tags :: [Tag],
    comments :: [Comment]} deriving Show


ticketCodes :: [User] -> Ticket -> (Char,String)
ticketCodes uss tk = (stat, usr) where
    stat = tsCode $ tstatus tk
    usr = case assignee tk of
            Just tu   -> alias $ resolveUser uss tu
            Nothing   -> []

instance Binary Ticket where
    put tk = do
        put (cid tk)
        put (author tk)
        put (title tk)
        put (tstatus tk)
        put (description tk)
        put (priority tk)
        put (assignee tk)
        put (tags tk)
        put (comments tk)

    get = do
        lCid <- get 
        lAuthor <- get
        lTitle <- get
        lStatus <- get
        lDesc <- get
        lPrior <- get
        lAssign <- get
        lTags <- get
        lComms <- get
        return $ PMTicket lCid lAuthor lTitle lStatus lDesc lPrior lAssign lTags lComms


instance Eq Ticket where
    ta == tb = cid ta == cid tb



hasTag :: Ticket -> String -> Bool
hasTag tk s = (PMTag s) `elem` (tags tk)

shTicket uss tk = do
    --putStrLn $ title tk
    let describe n = case tstatus tk of
                        TSassigned -> "Ticket #" ++  show n ++ " assigned to " ++ assigned
                        ts         -> show ts ++ " ticket #" ++ show n
        assigned = case assignee tk of
                        Just u -> alias $ resolveUser uss u
                        _      -> "(not assigned)"
    putStrLn $ describe (cid tk) 







instance JSON Ticket where
    readJSON (JSObject job) =
        case valFromObj "ticket" job of
            Ok jticket ->
                        Ok $ PMTicket {
                            author = case fieldOrId "author" jticket of
                                        Left u  -> u
                                        Right e -> error e,
                            cid = vf jticket "cid",
                            tstatus = vf jticket "status",
                            priority = vf jticket "priority",
                            tags = vf jticket "tags",
                            title = vf jticket "title",
                            description = vf jticket "description",
                            -- closer = vf jticket "closed_by"
                            assignee = case fieldOrId "assignee" jticket of
                                            Left u  -> Just u
                                            Right _ -> Nothing,
                            comments = vf jticket "comments" --[] comments not stored
                            }
            Error e -> Error e
      where
        fieldOrId fn job =
            case valFromObj fn job of
                Ok user -> Left $ Left user
                Error e -> case valFromObj (fn ++ "_id") job of
                                Ok uid   -> Left $ Right uid
                                Error e2 -> Right $ "multiple author decoding failed: " ++ e ++ "; " ++ e2  
    showJSON = undefined	

instance JSON TicketStatus where
    readJSON jv | v `elem` [0..5] = Ok $ [TSopen,TSassigned,TScompleted,TSwontFix,TScantReproduce,TSduplicate]!!v
                | otherwise        = Error $ "Invalid status value: " ++ show v
      where Ok v = fromJSON jv

    showJSON = undefined