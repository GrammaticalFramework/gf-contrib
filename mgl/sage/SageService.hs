{-# LANGUAGE OverloadedStrings, DeriveGeneric, RecordWildCards #-}
module SageService (
	SageHost(..),
	evaluateBlock ) where
import GHC.Generics
import Network.HTTP as H
import Network.URI
import Network.Stream as NS 
import qualified Network.WebSockets as WS
import Control.Applicative
import Control.Monad
import Control.Monad.Trans ( liftIO )
import Control.Concurrent -- ( forkIO, threadDelay, ThreadId, killThread )
import Data.List ( partition )
import Data.UUID ( UUID() )
import Data.UUID.Aeson
import IPython
import Data.List ( isPrefixOf )
import Data.Maybe ( mapMaybe )
import Data.Aeson ( FromJSON, encode, decode, toJSON, Result )
import Data.Text ( pack, unpack )
import qualified Data.ByteString.Lazy.Char8 as C
import System.IO 

type SageProtocol = WS.Hybi00
type SageMessage  = WS.DataMessage SageProtocol
type SageApp a    = WS.WebSockets SageProtocol a
type NResult a = NS.Result a
type AResult a = Data.Aeson.Result a

data SageHost = SgHt {
	host :: String,
	port :: Maybe Int,
	client :: String }

localHost :: String -> SageHost
localHost = SgHt "localhost" (Just 8888)

data SageKernel = SgKer {
	kernel_id :: UUID,
	ws_url :: String
} deriving (Generic, Show)

instance FromJSON SageKernel


connectTo :: String -> SageKernel -> SageApp a -> IO a
connectTo name (SgKer {..}) app = do
	WS.connect host port kernelUri app
 where
    Just uri = parseURI $ ws_url ++ "kernel/" ++ show kernel_id ++ "/" ++ name
    Just auth = uriAuthority uri
    host = uriRegName auth
    port = case uriPort auth of
    			':':sport -> read sport
    			_         -> 80  -- default port
    kernelUri = uriPath uri


withIoPub, withShell :: SageKernel -> SageApp a -> IO a
 
withShell = connectTo "shell"
withIoPub = connectTo "iopub"


getKernel :: SageHost -> IO (NResult SageKernel)
getKernel SgHt{..} = do
	result <- simpleHTTP req1
	return $ case result of 
		Right r ->
			let body = rspBody r
			in case decode . C.pack $ body of
					Just v -> Right v
					_      -> Left (ErrorMisc body) 
		Left e     -> Left e
  where
  	acceptJSON = H.mkHeader HdrAcceptEncoding "application/json"
  	uri = "http://" ++ host ++ maybe "" ((':':) . show) port ++ "/kernel"
  	req = postRequest uri
  	req1 = setHeaders req [acceptJSON]



evaluateBlock :: SageHost -> [Expr] -> IO [Expr]
evaluateBlock sh exps = do
	msage <- getKernel sh
	let sage = case msage of
		Left serr -> error $ "On getting kernel:" ++ show serr
		Right s -> s
	ses <- newSession
	m1 <- execute ses [] ex1
	mRest <- mapM (executeTake ses) exRest
	let msgs = m1:mRest
	mapM_ print $ filter (not . (isPrefixOf "GfContext")) exps
	-- forkIO $ withIoPub sage $ receivePrint -- DEBUG
	ress <- withShell sage $ sendCmds msgs
	return $ reverse $ mapMaybe (lookup retVar) ress
  where
  	user = client sh
  	retVar = "RETVAL"
  	ex1:exRest =  exps
  	executeTake ses e = execute ses [retVar] (retVar ++ " = " ++ e)
  	executeSome ses (e,mv) =
  		case mv of
  			Just v  -> execute ses [v] (v ++ " = " ++ e)
  			Nothing -> execute ses [] e 
  	execute ses vs e = mkExecute (user,ses) e vs (Dict [])
	
  	sendCmds msgs = do
  		let lh = header (last msgs)
  		-- liftIO $ mapM_ print msgs -- DEBUG
  		mapM_ (WS.sendTextData . encode . toJSON) msgs
  		collectUntil lh []
  	collectUntil h rs = do
		WS.Text jm <- WS.receiveDataMessage
		-- liftIO $ print (h,jm)
		case decode jm of
			Nothing -> error $ "Decoding of"  ++ show jm
			Just m -> do
					mv <- dispatchReply m
					case mv of
						Just v -> do
							let rs' = v:rs
							if parent_header m == Just h
								then return rs'
								else collectUntil h rs'
						_      -> collectUntil h rs
			
	dispatchReply m = do
		-- liftIO $ print m
		case getShellContent m of
			Right (ExecOk n (Dict vs) _) -> return (Just vs)
			Right (ExecErr name s _)     -> do
				liftIO $ putStrLn $ "! " ++ name ++ ": " ++ s
				return Nothing
			other                        -> do
				-- liftIO $ print other
				return Nothing
	receivePrint :: SageApp ()
	receivePrint = forever $ do
		WS.Text m <- WS.receiveDataMessage
		liftIO $ print m
	
			

test :: IO ()
test = do
	evaluateBlock (localHost "gfsage")  ["a = factor(2013)", "a"] >>= print
	threadDelay(10^6)