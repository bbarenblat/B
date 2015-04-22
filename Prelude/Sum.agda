module B.Prelude.Sum where

import Data.Sum

open Data.Sum
  using (_⊎_; inj₁; inj₂; [_,_]; [_,_]′)
  public

module Sum where
  open Data.Sum
    using (isInj₁; isInj₂)
    public
