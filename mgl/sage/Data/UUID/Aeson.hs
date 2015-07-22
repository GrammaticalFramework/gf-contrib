module Data.UUID.Aeson where 
import Control.Applicative ( pure )
import Control.Monad ( mzero )
import Data.UUID ( UUID(), toString, fromString )
import Data.Text ( pack, unpack )
import Data.Aeson

instance ToJSON UUID where
	toJSON u = String (pack $ toString u)

instance FromJSON UUID where
	parseJSON = withText "UUID" pu where
		pu s = maybe mzero pure $ fromString $ unpack s