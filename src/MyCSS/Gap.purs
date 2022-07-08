module MyCSS.Gap
  ( gap
  )
  where

import Prelude
import CSS (Size, CSS, fromString, key)

gap :: forall a. Size a -> CSS
gap = key $ fromString "gap"
