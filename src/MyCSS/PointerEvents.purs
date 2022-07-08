module MyCSS.PointerEvents
  ( PointerEventsValue(..)
  , pointerEvents
  )
  where

import Prelude
import CSS (class Val, CSS, fromString, key)

data PointerEventsValue
  = PointerEventsAuto
  | PointerEventsNone

instance valPointerEventsValue :: Val PointerEventsValue where
  value =
    fromString
      <<< case _ of
          PointerEventsAuto -> "auto"
          PointerEventsNone -> "none"

pointerEvents :: PointerEventsValue -> CSS
pointerEvents = key $ fromString "pointer-events"
