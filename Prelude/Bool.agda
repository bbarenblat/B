module B.Prelude.Bool where

open import B.Prelude.BooleanAlgebra using (BooleanAlgebra)
import Data.Bool
import Data.Bool.Properties

open Data.Bool
  using (Bool; if_then_else_; T)
  public

instance
  BooleanAlgebra-Bool : BooleanAlgebra _ _
  BooleanAlgebra-Bool = Data.Bool.Properties.booleanAlgebra

module Bool where
  open Data.Bool
    using (_xor_)
    public
