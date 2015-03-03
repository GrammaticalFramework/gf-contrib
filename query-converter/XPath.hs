module XPath where

import ToXML

data XPath =
   XPRoot
 | XPElem XPath Axis Id Condition
 | XPAttr XPath Axis Attr