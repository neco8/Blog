module Page.Article where

import Prelude
import Data.Const (Const)
import Halogen as H
import Halogen.HTML as HH
import MyCSS as C
import Type.Proxy (Proxy(..))

-- css
css :: C.CSS
css = do
  pure unit

-- component
articleComponent :: forall m. H.Component (Const Void) Unit Void m
articleComponent =
  H.mkComponent
    { initialState: identity
    , render: const $ HH.text "article"
    , eval: H.mkEval H.defaultEval
    }

_articleComponent = Proxy :: Proxy "articleComponent"

type Slot r
  = ( articleComponent :: H.Slot (Const Void) Void Unit | r )
