module MyCSS.AspectRatio
  ( AspectRatio(..)
  , AspectRatioValue(..)
  , aspectRatio
  , oldTV
  , rotateAspectRatio
  , square
  , tv
  )
  where

import Prelude

import CSS (class Val)
import CSS.String (fromString)
import CSS.Stylesheet (CSS, key)

data AspectRatio = AspectRatio Number
  | AspectRatioAuto Number

instance showAspectRatio :: Show AspectRatio where
  show = case _ of
    AspectRatio n -> show n
    AspectRatioAuto n -> "auto " <> show n

data AspectRatioValue = AspectRatioValue AspectRatio AspectRatio

instance valAspectRatio :: Val AspectRatioValue where
  value (AspectRatioValue a b) = fromString $ show a <> " / " <> show b

aspectRatio :: AspectRatioValue -> CSS
aspectRatio = key $ fromString "aspect-ratio"

square :: AspectRatioValue
square = AspectRatioValue (AspectRatio 1.0) (AspectRatio 1.0)

oldTV :: AspectRatioValue
oldTV = AspectRatioValue (AspectRatio 4.0) (AspectRatio 3.0)

tv :: AspectRatioValue
tv = AspectRatioValue (AspectRatio 16.0) (AspectRatio 9.0)

rotateAspectRatio :: AspectRatioValue -> AspectRatioValue
rotateAspectRatio (AspectRatioValue a b) = AspectRatioValue b a