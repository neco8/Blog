module MyCSS.Any where

import Prelude
import CSS (class IsString, class Val, Value, fromString)

newtype Any
  = Any Value

instance valAny :: Val Any where
  value (Any v) = v

instance isStringAny :: IsString Any where
  fromString = Any <<< fromString
