module MyCSS.ColorGen where

import Prelude
import Test.QuickCheck.Gen (Gen, chooseInt)
import CSS (Color, rgb)

colorGen :: Gen Color
colorGen = rgb <$> gen <*> gen <*> gen
  where
  gen = chooseInt 0 255
