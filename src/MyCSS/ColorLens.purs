module MyCSS.ColorLens
  ( _hsla
  , _rgba
  ) where

import Prelude
import CSS (Color, hsla, rgba, toHSLA, toRGBA)
import Data.Lens (Lens', lens')
import Data.Tuple (Tuple(..))

_rgba :: Lens' Color { r :: Int, g :: Int, b :: Int, a :: Number }
_rgba = lens' (\color -> Tuple (toRGBA color) (\b -> rgba b.r b.g b.b b.a))

_hsla :: Lens' Color { h :: Number, s :: Number, l :: Number, a :: Number }
_hsla = lens' (\color -> Tuple (toHSLA color) (\b -> hsla b.h b.s b.l b.a))
