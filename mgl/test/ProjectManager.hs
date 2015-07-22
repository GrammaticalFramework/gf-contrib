module ProjectManager where
import ProjectData
import GPUser
import GPTicket
import Defect
import Treebank (ISOLang, CSSelector(..))
import Network.Curl
import Network.OAuth.Consumer
import Network.OAuth.Http.CurlHttpClient
import Network.OAuth.Http.Request
import Network.OAuth.Http.Response
import Text.Regex
--import Text.JSON
import Text.JSON.Generic
import Data.Binary
import Data.Char (isDigit)
import Data.ByteString.Lazy.Char8 (unpack, pack)
import Data.List (intersperse, isInfixOf)
import Data.Map (insertWith)
import Data.Maybe (fromJust)
import Text.XML.Light

http = "http://"
oauth = "/oauth/"
managerHost = http ++ base
companyHost = http ++ company ++ ('.':base)


mayProceed :: URLString -> IO CurlResponse
mayProceed url = do
	(st, body) <- curlGetString url [CurlFollowLocation True]
	putStrLn $ show st
	putStrLn body
	let authenticityToken = case matchRegex authenticityTokenRe body of
				Just [s] ->s
				_        -> error "Not found authenticity_token"
	curlGetResponse url2 [opts authenticityToken]
  where
	authTokenRe = mkRegex "oauth_token=([^\"]+)"
	authToken = case matchRegex authTokenRe url of
		Just [tk] -> tk
		_		  -> error "No auth token found"
	authenticityTokenRe = mkRegex "authenticity_token\" type=\"hidden\" value=\"([^\"]+)\""
	url2 = companyHost ++ oauth ++ "authorize"
	opts tok = CurlPostFields [
		"authenticity_token=" ++ tok,
		"oauth_token=" ++ authToken,
		"authorize=0"]
	
mkRequest :: String -> Request
mkRequest = fromJust . parseURL

reqUrl    = mkRequest $  managerHost ++ oauth ++ "request_token"
accUrl    = mkRequest $ managerHost ++ oauth ++ "access_token"
authUrl   = ((companyHost ++ oauth ++ "authorize?oauth_token=")++) . findWithDefault ("oauth_token","ERROR") . oauthParams
app       = Application companyKey companySecret OOB
rtoken    = ReqToken app empty

byOAuthRequest :: Request -> IO Response
byOAuthRequest request = runOAuthM rtoken access where
 	access = do
		signRq2 HMACSHA1 Nothing reqUrl >>= oarequest
		cliAskAuthorization authUrl
		signRq2 HMACSHA1 Nothing accUrl >>= oarequest
		signRq2 HMACSHA1 Nothing request >>= svrequest
	oarequest = oauthRequest CurlClient
	svrequest = serviceRequest CurlClient
	
--
-- Company API
--
companyApi = companyHost ++ "/api/"
projectApi = companyHost ++ "/" ++ project ++ "/api/"
mkApiRequest pre = mkRequest . (pre++)
getAllActivities, getAllTickets :: Request
getAllActivities = mkApiRequest companyApi "activities/get_all?format=json"
getAllTickets = mkApiRequest projectApi "tickets/get_all?format=json"

	
	
--
-- Users
--

	
getAllUsers :: Request
getAllUsers = mkApiRequest companyApi "users/get_all?format=json"


getUsers :: IO (Result [User])
getUsers = do
	resp <- byOAuthRequest getAllUsers
	return . Text.JSON.Generic.decode . unpack . rspPayload $ resp
	
	
getTickets :: IO (Result [Ticket])
getTickets = do
	resp <- byOAuthRequest $ getAllTickets
	return . Text.JSON.Generic.decode. unpack . rspPayload $ resp

getOrFail :: Result a -> IO a
getOrFail res = do
    return $ case res of
        	Ok xs   -> xs
        	Error e -> error e   

getTicketsOrFail = getTickets >>= getOrFail
getUsersOrFail = getUsers >>= getOrFail

findInDesc :: [Ticket] -> String -> Maybe Int
findInDesc tks s =
    case filter ((s `isInfixOf`).description.snd) $ zip [0..] tks of
        []      -> Nothing
        (n,_):_ -> Just n
        

createDummy :: IO String
createDummy = do
	let request = createTicket "foo" 1 Nothing [] []
	resp <- byOAuthRequest request
	return . unpack . rspPayload $ resp
	
	
-- 
-- Save commits
--
feedCommit :: URLString -> String -> IO ()
feedCommit url msg = do
	resp <- curlGetResponse url [post]
	putStrLn $ respBody resp
  where
	pl = toJSObject  [("message", msg)]
	post = CurlPostFields ["payload=" ++ Text.JSON.Generic.encode pl]
    
    
--
--
--
getEntry :: Ticket -> Maybe Int
getEntry tk =
    case reverse (title tk) of
        ')':rest -> case break (=='(') rest of
                        (rnum,'(':_) -> if all isDigit rnum
                                            then Just $ read (reverse rnum)
                                            else Nothing
                        _            -> Nothing
        _        -> Nothing
        
        
getLang :: Ticket -> Maybe ISOLang
getLang tk =
    case filter (hasTag tk) testlangs of
        [l] -> Just l
        []        -> Nothing
        _         -> error "More than 1 lang tag?"
        
        
mkTS :: Ticket -> Maybe Defect
mkTS tk =
    case (getEntry tk, getLang tk) of
        (Just n, Just l)  -> let
                                selc = Sel (l,Nothing)
                             in Just $ Def n selc st [show $ cid tk]
        _                 -> Nothing
  where
     st = case tstatus tk of
            TSopen      -> Sunassigned
            TSassigned  -> Sassigned $ case assignee tk of
                                        Just (Left u)  -> uid u
                                        Just (Right n) -> n
                                        _              -> error $ "Assigned to no one"
            TScompleted -> Scompleted
            TSwontFix | hasTag tk "rgl"  -> Swontfix "RGL"
                      | otherwise        -> Swontfix "No reason?"
            TScantReproduce -> Swontfix "Cannot reproduce"
            TSduplicate     -> Swontfix "Duplicated"


entries4tickets :: [Ticket] -> EntryMap
entries4tickets tks = foldr add2map emptyStatus tks

add2map :: Ticket -> EntryMap -> EntryMap
add2map tk amap =
    case mkTS tk of
        Just en@(Def n sel st tks) -> insertWith (+:+) (n,sel) en amap
        _                            -> amap
        
        
ticketsXML :: [Ticket] -> Element
ticketsXML tks = blank_element {
    elName = qn "tickets",
    elContent = map (Elem . ticketXML) tks}
  where
    qn s = blank_name {qName = s}
    cd s = blank_cdata {cdData = s}
    ticketXML tk = Element {
        elName = qn "h4",
        elAttribs = [], -- idAtt, statusAtt],
        --elContent = [Elem titleEl, Elem descEl],
        elContent = [(Text . cd . show . title) tk],
        elLine = Nothing }
      where
        idAtt = Attr (qn "id") $ show (cid tk)
        statusAtt = Attr (qn "status") $
            case tstatus tk of
                TSopen -> "open"
                TSassigned -> "assigned"
                TScompleted -> "completed"
                TSwontFix -> "wont-fix"
                TScantReproduce -> "cant-reproduce"
                TSduplicate -> "duplicated"
        titleEl = blank_element {
            elName = qn "title",
            elContent = [Text $ cd $ title tk ]}
        descEl = blank_element {
            elName = qn "description",
            elContent = parseXML (description tk) }
        
    
store :: [Ticket] -> FilePath -> IO ()
retrieve :: FilePath -> IO [Ticket]
store tks path = (writeFile path . unpack . Data.Binary.encode) tks
retrieve path = do
    enctks <- readFile path
    return $ Data.Binary.decode $ pack enctks


completeTicket :: Ticket -> IO Ticket
completeTicket tk = do
    let request = mkApiRequest projectApi $
            "tickets/get/" ++ show (cid tk) ++ 
            "?format=json"
    resp <- byOAuthRequest request
    let result = Text.JSON.Generic.decode. unpack . rspPayload $ resp
    tk2 <- getOrFail result
    return $ tk2 {author = author tk}


main :: FilePath -> Int -> IO ()
main path n = do
    let request = getAllTickets
    resp <- byOAuthRequest request
    let result = Text.JSON.Generic.decode. unpack . rspPayload $ resp
    tks <- getOrFail result
    putStrLn $ "There are " ++ show (length tks) ++ " tickets."
    ctks <- mapM completeTicket $ take n tks
    writeFile path $ encodebin $ ctks
  where
    encodebin = unpack . Data.Binary.encode


createTicket :: String -> Priority -> Maybe User -> String -> [Tag] -> Request
createTicket title priority assignee description tags | priority `elem` [1..5] =
    mkApiRequest companyApi $
        "tickets/create?format=json&" ++ concat (insamp fields)
  where
    insamp = intersperse "&"
    mkField key value = "ticket[" ++ key ++ "]=" ++ value
    projectFd = "project=" ++ project
    titleFd = mkField "title" title 
    priorityFd = mkField "priority" $ show priority
    assigneeFd = maybe [] (\user -> mkField "assignee_id" (show $ uid user)) assignee
    descFd = if null description
                then []
                else mkField "description" description
    tagsFd = if null tags
                then []
                else concat $ insamp ["tags[]=" ++ tg | PMTag tg <- tags]
    fields = [projectFd,titleFd,priorityFd] ++
                filter (not.null) [assigneeFd, descFd, tagsFd]

mkTicket assignee title priority description tags = do
    {-putStrLn title
    putStrLn $ show priority
    putStrLn description -}
    byOAuthRequest req
    -- putStrLn $ unpack.rspPayload $ resp
  where
    tgs = [PMTag t | t <- tags]
    req = createTicket title priority assignee description tgs




    

        
    