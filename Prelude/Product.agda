module B.Prelude.Product where

import Data.Product

open Data.Product
  using (_×_; proj₁; proj₂; _,_; _,′_; curry; uncurry; uncurry′)
  public

module Product where
