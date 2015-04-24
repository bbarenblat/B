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

module B.Prelude.Functor where

import Category.Monad as Monad
import Category.Functor
import Data.List
import Data.Maybe
open import Function using (_∘_)

open Category.Functor
  using (RawFunctor)
  public

open Category.Functor.RawFunctor ⦃...⦄
  using (_<$>_)
  public

instance
  Functor-List : ∀ {ℓ} → RawFunctor (Data.List.List {ℓ})
  Functor-List = Monad.RawMonad.rawFunctor Data.List.monad

  Functor-Maybe : ∀ {ℓ} → RawFunctor (Data.Maybe.Maybe {ℓ})
  Functor-Maybe = Monad.RawMonad.rawFunctor Data.Maybe.monad

  Functor-Function : ∀ {ℓ} {r : Set ℓ} → RawFunctor {ℓ} (λ s → (r → s))
  Functor-Function {r} =
    -- I could say _<$>_ = _∘_ here, but that makes type checking much more
    -- challenging.
    record { _<$>_ = λ f g → f ∘ g }

  -- TODO: Do proper instance for dependent pairs
