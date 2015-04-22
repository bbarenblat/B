module B.Prelude.Char where

import Data.Char

open Data.Char
  using (Char)
  public

module Char where
  open Data.Char
    using (toNat)
    public
