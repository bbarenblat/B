module B.Prelude.String where

import Data.String

open Data.String
  using (String; unlines)
  public

module String where
  open Data.String
    using (_++_; fromList; toCostring; toList; toVec)
    public
