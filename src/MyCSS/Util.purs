module MyCSS.Util
  ( renderInline
  , renderSheet
  ) where

import Prelude
import CSS as C
import Data.Maybe (fromMaybe)

renderInline :: C.CSS -> String
renderInline = fromMaybe "" <<< C.renderedInline <<< C.render

renderSheet :: C.CSS -> String
renderSheet = fromMaybe "" <<< C.renderedSheet <<< C.render
