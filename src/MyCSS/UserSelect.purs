module MyCSS.UserSelect
  ( UserSelectValue(..)
  , userSelect
  , userSelectAll
  , userSelectAuto
  , userSelectContain
  , userSelectNone
  , userSelectText
  ) where

import Prelude
import CSS (class IsString, class Val, CSS, Value, fromString, key)

newtype UserSelectValue
  = UserSelectValue Value

instance valUserSelectValue :: Val UserSelectValue where
  value (UserSelectValue v) = v

instance isStringUserSelectValue :: IsString UserSelectValue where
  fromString = UserSelectValue <<< fromString

userSelectNone :: UserSelectValue
userSelectNone = fromString "none"

userSelectAuto :: UserSelectValue
userSelectAuto = fromString "auto"

userSelectText :: UserSelectValue
userSelectText = fromString "text"

userSelectContain :: UserSelectValue
userSelectContain = fromString "contain"

userSelectAll :: UserSelectValue
userSelectAll = fromString "all"

userSelect :: UserSelectValue -> CSS
userSelect = key $ fromString "user-select"
