module PdTicket where

type PdTag = String

data PdTicket =  PdTicket {
    entry :: Int,
    title :: String,
    pstatus :: PdTicketStatus,
    description :: String,
    priority :: PdPriority,
    tags :: [PdTag],
    comments :: [PdComment]} deriving Show

data PdTicketStatus
    = Reported
    | Accepted
    | Assigned PdUser
    | Fixed
    | Duplicate
    | Rejected
    | RGL

instance JSON PdTicketStatus where
    showJSON Reported = shwJSON "Reported"
    showJSON Accepted = shwJSON "Accepted"
    showJSON Assigned _ = shwJSON "Assigned"
    showJSON Fixed = shwJSON "Fixed"
    showJSON Duplicate = shwJSON "Duplicate"
    showJSON Rejected = shwJSON "Rejected - works for me"
    showJSON RGL = shwJSON "Rejected - RGL dependent"

    readJSON = undefined




instance JSON PdTicket where
    showJSON tk = case (pstatus tk) of
        Assigned u -> mkField "developer-assigned" (profile u)

        [
        mkField "title" (title tk),
        mkField "description-of-problem" (description tk),
        mkField "treebank-entry" (entry tk),
        mkField "status" (pstatus tk)]
        
        
        


mkValue :: JSON a => a -> JSValue
mkValues :: JSON a => [a] -> JSValue
mkField :: JSON a => String -> [a] -> JSValue 

mkValue v = makeObj [("value", showJSON v)]
mkValues vs = JSArray $ map makeObj vs
mkField k vs = makeObj $ ("external-id",showJSON k):(makeValues vs)

