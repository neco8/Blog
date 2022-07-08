module MyCSS.PlaceItems
  ( PlaceItemsValue(..)
  , placeItems
  )
  where

import Prelude
import CSS (class IsString, class Val, CSS, Value, fromString, key)

newtype PlaceItemsValue
  = PlaceItemsValue Value

instance valPlaceItemsValue :: Val PlaceItemsValue where
  value (PlaceItemsValue v) = v

instance isStringPlaceItemsValue :: IsString PlaceItemsValue where
  fromString = PlaceItemsValue <<< fromString

placeItems :: PlaceItemsValue -> CSS
placeItems = key $ fromString "place-items"
