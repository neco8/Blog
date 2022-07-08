module Article where

import Prelude

import Data.Const (Const)
import Halogen as H
import Halogen.HTML as HH

-- css

-- component

articleComponent :: forall m. H.Component (Const Void) Unit Void m
articleComponent =
  H.mkComponent
    { initialState: identity
    , render: const $ HH.text "article"
    , eval: H.mkEval H.defaultEval
    }
