module MyCSS.Overflow
  ( OverflowValue(..)
  , OverflowXYValue(..)
  , overflow
  , overflowAuto
  , overflowClip
  , overflowHidden
  , overflowScroll
  , overflowVisible
  ) where

import Prelude
import CSS (class IsString, class Val, CSS, Value, fromString, key, value)

newtype OverflowXYValue
  = OverflowXYValue Value

instance valOverflowXYValue :: Val OverflowXYValue where
  value (OverflowXYValue v) = v

instance isStringOverflowValue :: IsString OverflowXYValue where
  fromString = OverflowXYValue <<< fromString

overflowVisible :: OverflowXYValue
overflowVisible = fromString "visible"

overflowHidden :: OverflowXYValue
overflowHidden = fromString "hidden"

overflowClip :: OverflowXYValue
overflowClip = fromString "clip"

overflowScroll :: OverflowXYValue
overflowScroll = fromString "scroll"

overflowAuto :: OverflowXYValue
overflowAuto = fromString "auto"

data OverflowValue
  = OverflowBoth OverflowXYValue
  | OverflowEach OverflowXYValue OverflowXYValue

instance valOverflowValue :: Val OverflowValue where
  value = case _ of
    OverflowBoth v -> value v
    OverflowEach vm vn -> value vm <> fromString " " <> value vn

overflow :: OverflowValue -> CSS
overflow = key $ fromString "overflow"
