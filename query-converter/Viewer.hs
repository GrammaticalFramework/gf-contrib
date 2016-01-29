module Viewer where

import System.Info (os)

-- for viewing E-R designs and relational algebra files

viewer = case os of
  "darwin" -> "open"
  "linux"  -> "xdg-open"
