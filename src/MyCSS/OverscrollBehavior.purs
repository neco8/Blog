module MyCSS.OverscrollBehavior
  ( OverscrollBehaviorValue(..)
  , overscrollBehavior
  )
  where

import Prelude

import CSS (class Val, CSS, fromString, key)

data OverscrollBehaviorValue
  = OverscrollBehaviorAuto
  | OverscrollBehaviorNone
  | OverscrollBehaviorContain

instance valOverscrollBehaviorValue :: Val OverscrollBehaviorValue where
  value = fromString <<< case _ of
    OverscrollBehaviorAuto -> "auto"
    OverscrollBehaviorNone -> "none"
    OverscrollBehaviorContain -> "contain"

overscrollBehavior :: OverscrollBehaviorValue -> CSS
overscrollBehavior = key $ fromString "overscroll-behavior"