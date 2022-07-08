module Marked where

import Prelude
import Data.Either (Either(..))

newtype Parsed
  = Parsed String

foreign import parse_ ::
  (forall err a. err -> Either err a) ->
  (forall err a. a -> Either err a) ->
  (String -> Parsed) ->
  String -> Either String Parsed

parse :: String -> Either String Parsed
parse = parse_ Left Right Parsed
