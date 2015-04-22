module B.Prelude.Maybe where

import Data.Maybe

open Data.Maybe
  using (Maybe; just; nothing; maybe; maybe′)
  public

module Maybe where
  open Data.Maybe
    using (from-just; is-just; is-nothing)
    public
