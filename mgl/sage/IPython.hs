{-# LANGUAGE OverloadedStrings, DeriveGeneric, RecordWildCards #-}

module IPython (
	Expr, Dict(Dict), Reply(..), Variable,
	header, parent_header,
	newSession,
	mkExecute,
	getShellContent ) where
import GHC.Generics
import Control.Monad ( mzero )
import Control.Applicative
import Data.UUID.Aeson
import Data.HashMap.Strict ( toList )
import Data.UUID ( UUID )
import Data.UUID.V4 ( nextRandom )
import Data.Aeson 
import Data.Aeson.Types ( parseEither, Parser )
import Data.Text ( pack, unpack )


-- Taken from http://ipython.org/ipython-doc/stable/development/messaging.html
type User = String
type Session = UUID
type Variable = String
type Expr = String
newtype Dict a = Dict [(String, a)]
	deriving Show
type Client = (User, Session)
type MsgType = String
type Shell = Either Request Reply

instance ToJSON v => ToJSON (Dict v) where
	toJSON (Dict kvs) =
		object $ map (\(k,v) -> pack k .= toJSON v) kvs

instance FromJSON v => FromJSON (Dict v) where
	parseJSON (Object o) =
		Dict <$> mapM (\(k,v) -> do
							j <- parseJSON v
							return (unpack k, j)) (toList o)
	parseJSON _          = mzero


data Header = Head {
	msg_id   :: UUID,
	username   :: User,
	session    :: Session,
	msg_type :: MsgType

} deriving (Show,Generic,Eq)

instance FromJSON Header
instance ToJSON Header 



data Message = Msg {
	header   :: Header,
	parent_header :: Maybe Header,
	content :: Value
} deriving (Show,Generic)


newSession :: IO Session
mkHeader :: Client -> MsgType -> IO Header 

mkExecute :: Client -> Expr -> [Variable] -> Dict Expr -> IO Message
mkExecute cl expr vs (Dict ues) = do
	h <- mkHeader cl "execute_request"
	return $ Msg h Nothing (toJSON request)
	where
		request = ExecRq expr vs user_exp
		user_exp = Dict $ ("_sagecell_files", "sys._sage_.new_files()"):ues


newSession = nextRandom 

mkHeader (user,ses) mt = do
	i <- nextRandom
	return $ Head i user ses mt

instance FromJSON Message where
	parseJSON (Object o) = do
		h <- o .: "header"
		ph <- o .: "parent_header"
		mph <- if ph == none
			then return Nothing
			else parseJSON ph >>= return . Just
		cont <- o .: "content"
		return $ Msg h mph cont
	  where none = object []  

instance ToJSON Message where
	toJSON (Msg h mph cont) = object [
		"header" .= h,
		"metadata" .= none,
		"content" .= cont,
		"allow_stdin" .= False,
		"parent_header" .= maybe none toJSON mph ]
	  where none = object []


-- Messages on the SHELL socket

data Request
	= ExecRq Expr [Variable] (Dict Expr)
	| ShutdownRq Bool
  deriving Show

data Reply = 
	ExecOk Int (Dict Expr) (Dict Expr)
	| ExecErr String String [String]
	| ShutdownRl Bool
	deriving Show

instance ToJSON Reply where
	toJSON = undefined

data ExecStatus = SOk | SError | SAbort
  deriving Show
instance FromJSON ExecStatus where
	parseJSON =
		withText "ExecStatus" (\s -> case s of
			"ok" -> return SOk
			"error" -> return SError
			"abort" -> return SAbort
			_       -> mzero)


getShellContent :: Message -> Shell
getShellContent (Msg {..}) =
	case msg_type header of
		"execute_request"  -> Left $ parseError psExecRq 
		"execute_reply"    -> Right $ parseError psExecRl
		mt                 -> error $ "Not implemented" ++ show mt
  where
  	parseError :: (Object -> Parser a) ->  a
  	parseError p = case parseEither p jContent of
  		Left serr -> error serr
  		Right j   -> j
  	Object jContent = content
	psExecRq v = ExecRq <$> 
		v .: "code" <*>
		v .: "user_variables" <*> 
		v .: "user_expressions"
	psExecRl v = do
		st <- v .: "status"
		case st of
			SOk -> ExecOk <$>
					v .: "execution_count" <*>
					v .: "user_variables" <*>
					v .: "user_expressions"
			SError -> ExecErr <$>
					v .: "ename" <*>
					v .: "evalue" <*>
					v .: "traceback"
			_  -> error $ "Not implemented: " ++ show st


instance ToJSON Request where
	toJSON (ExecRq e vs ues) = object [
		"code" .= e,
	    "silent" .= False,
	    "user_variables" .= vs,
	    "user_expressions" .= ues ]






-- Messages on the PUB socket

data Public = 
	Stream String String
	| PyIn  -- Ignore
	| PyOut Int (Dict String)
	| PyErr String String [String]
	| KerStat Bool -- busy /idle
	| KerCrash String
  deriving Show

getPubContent :: Message -> Public
getPubContent (Msg {..}) =
	case msg_type header of
		"status" -> parseError psStatus
		"pyin"   -> PyIn
		"pyout"  -> parseError psPyout
		mt       -> error $ "Not implemented in iopub: " ++ show mt

  where
  	Object jContent = content
  	parseError :: (Object -> Parser a) -> a
  	parseError p = case parseEither p jContent of
  		Left serr -> error serr
  		Right j -> j
  	psStatus v = do
  			st <- v .: "execution_state"
  			return $ KerStat $ case st of
  				"busy" -> True
  				"idle" -> False
  				_      -> error $ "Unknown execution_state: " ++ st
  	psPyout v = PyOut <$>
  		v .: "execution_count" <*>
  		v .: "data"






test :: IO ()
test = do
	s <- newSession
	msg <- mkExecute ("GF", s) "a = factor(2013)" ["a"] (Dict [])
	let res = encode  msg
	print res
	let Just m = decode res :: Maybe Message
	    h = header m
	putStrLn $ "message id: " ++ show (msg_id h) ++ ", session: " ++ show (session h)