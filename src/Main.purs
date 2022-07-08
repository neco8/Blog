module Main where

import Prelude
import Data.Const (Const)
import Data.Foldable (traverse_)
import Effect (Effect)
import Effect.Console (log)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.CSS as HC
import Halogen.VDom.Driver (runUI)
import MyCSS as C
import Page.Article as Article
import Web.DOM.ParentNode (QuerySelector(..))

main :: Effect Unit
main =
  HA.runHalogenAff do
    traverse_ (runUI cssComponent unit) =<< HA.selectElement (QuerySelector "head")
    body <- HA.awaitBody
    runUI mainComponent unit body

css :: C.CSS
css = do
  Article.css

cssComponent :: forall m. H.Component (Const Void) Unit Void m
cssComponent =
  H.mkComponent
    { initialState: identity
    , render: const $ HC.stylesheet css
    , eval: H.mkEval H.defaultEval
    }

mainComponent :: forall m. H.Component (Const Void) Unit Void m
mainComponent =
  H.mkComponent
    { initialState: identity
    , render: const $ HH.slot_ Article._articleComponent unit Article.articleComponent unit
    , eval: H.mkEval H.defaultEval
    }
