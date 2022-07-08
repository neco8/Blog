module MyCSS.Grid
  ( GridAutoColumnsValue(..)
  , GridAutoFlowValue(..)
  , GridAutoRowsValue(..)
  , GridIdentifier(..)
  , GridTemplateValue(..)
  , GridValue(..)
  , gridAutFlowValueColumn
  , gridAutFlowValueColumnDense
  , gridAutFlowValueDense
  , gridAutFlowValueRow
  , gridAutFlowValueRowDense
  , gridAutoColumns
  , gridAutoFlow
  , gridAutoRows
  , gridColumn
  , gridRow
  , gridTemplateColumns
  , gridTemplateRows
  ) where

import Prelude
import CSS (class IsString, class Val, CSS, Value, fromString, key)

data GridIdentifier
  = GridNum Int
  | GridSpan Int
  | GridName String

instance showGridIdentifier :: Show GridIdentifier where
  show = case _ of
    GridNum n -> show n
    GridSpan n -> "span " <> show n
    GridName n -> n

data GridValue
  = On GridIdentifier
  | FromTo GridIdentifier GridIdentifier

instance showGridValue :: Show GridValue where
  show = case _ of
    On gi -> show gi
    FromTo gim gin -> show gim <> " / " <> show gin

instance valGridValue :: Val GridValue where
  value = fromString <<< show

gridColumn :: GridValue -> CSS
gridColumn = key $ fromString "grid-column"

gridRow :: GridValue -> CSS
gridRow = key $ fromString "grid-row"

newtype GridTemplateValue
  = GridTemplateValue Value

instance valGridTemplateValue :: Val GridTemplateValue where
  value (GridTemplateValue v) = v

instance isStringGridTemplateValue :: IsString GridTemplateValue where
  fromString = GridTemplateValue <<< fromString

gridTemplateColumns :: GridTemplateValue -> CSS
gridTemplateColumns = key $ fromString "grid-template-columns"

gridTemplateRows :: GridTemplateValue -> CSS
gridTemplateRows = key $ fromString "grid-template-rows"

newtype GridAutoFlowValue
  = GridAutoFlowValue Value

instance valGridAutoFlowValue :: Val GridAutoFlowValue where
  value (GridAutoFlowValue v) = v

gridAutFlowValueRow :: GridAutoFlowValue
gridAutFlowValueRow = GridAutoFlowValue $ fromString "row"

gridAutFlowValueColumn :: GridAutoFlowValue
gridAutFlowValueColumn = GridAutoFlowValue $ fromString "column"

gridAutFlowValueDense :: GridAutoFlowValue
gridAutFlowValueDense = GridAutoFlowValue $ fromString "dense"

gridAutFlowValueRowDense :: GridAutoFlowValue
gridAutFlowValueRowDense = GridAutoFlowValue $ fromString "row dense"

gridAutFlowValueColumnDense :: GridAutoFlowValue
gridAutFlowValueColumnDense = GridAutoFlowValue $ fromString "column dense"

gridAutoFlow :: GridAutoFlowValue -> CSS
gridAutoFlow = key $ fromString "grid-auto-flow"

newtype GridAutoColumnsValue
  = GridAutoColumnsValue Value

instance valGridAutoColumnsValue :: Val GridAutoColumnsValue where
  value (GridAutoColumnsValue v) = v

instance isStringGridAutoColumnsValue :: IsString GridAutoColumnsValue where
  fromString = GridAutoColumnsValue <<< fromString

gridAutoColumns :: GridAutoColumnsValue -> CSS
gridAutoColumns = key $ fromString "grid-auto-columns"

newtype GridAutoRowsValue
  = GridAutoRowsValue Value

instance valGridAutoRowsValue :: Val GridAutoRowsValue where
  value (GridAutoRowsValue v) = v

instance isStringGridAutoRowsValue :: IsString GridAutoRowsValue where
  fromString = GridAutoRowsValue <<< fromString

gridAutoRows :: GridAutoRowsValue -> CSS
gridAutoRows = key $ fromString "grid-auto-rows"
