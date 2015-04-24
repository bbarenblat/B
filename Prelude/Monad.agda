{- Copyright © 1992–2002 The University of Glasgow
Copyright © 2015 Benjamin Barenblat

Licensed under the Apache License, Version 2.0 (the ‘License’); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an ‘AS IS’ BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License. -}

module B.Prelude.Monad where

import Category.Monad
import Data.List
import Data.Maybe
open import Function using (const)

open Category.Monad
  using (RawMonad)
  public

open Category.Monad.RawMonad ⦃...⦄
  using (_>>=_; _>>_; return)
  public

instance
  Monad-List : ∀ {ℓ} → RawMonad (Data.List.List {ℓ})
  Monad-List = Data.List.monad

  Monad-Maybe : ∀ {ℓ} → RawMonad (Data.Maybe.Maybe {ℓ})
  Monad-Maybe = Data.Maybe.monad

  Monad-Function : ∀ {ℓ} {r : Set ℓ} → RawMonad (λ s → (r → s))
  Monad-Function {r} = record { return = const {r}
                              ; _>>=_ = λ f k → λ r → k (f r) r }
