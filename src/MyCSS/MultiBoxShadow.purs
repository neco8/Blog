module MyCSS.MultiBoxShadow where

import Prelude

import CSS (Abs, CSS, Color, Size, fromString, prefixed)
import CSS.Common (browsers)
import Data.Tuple (Tuple)

type MultiBoxShadowValue = Array (Tuple (Size Abs) (Tuple (Size Abs) (Tuple (Size Abs) (Tuple (Size Abs) Color))))

multiBoxShadow :: forall a. Array (Tuple (Size a) (Tuple (Size a) (Tuple (Size a) (Tuple (Size a) Color)))) -> CSS
multiBoxShadow = prefixed (browsers <> fromString "box-shadow")
