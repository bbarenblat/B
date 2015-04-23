{- Copyright © 2015 Benjamin Barenblat

Licensed under the Apache License, Version 2.0 (the ‘License’); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an ‘AS IS’ BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License. -}

module B.Prelude.Eq where

import Data.Bool as Bool
open Bool using (Bool)
import Data.Char as Char
open Char using (Char)
import Data.Nat as ℕ
open ℕ using (ℕ)
open import Function using (_$_)
import Level
open Level using (_⊔_)
open import Relation.Nullary.Decidable using (⌊_⌋)
open import Relation.Binary using (DecSetoid)

record Eq {c} {ℓ} (t : Set c) : Set (Level.suc $ c ⊔ ℓ) where
  field
    decSetoid : DecSetoid c ℓ

  _≟_ = DecSetoid._≟_ decSetoid

  _==_ : DecSetoid.Carrier decSetoid
       → DecSetoid.Carrier decSetoid
       → Bool
  x == y = ⌊ x ≟ y ⌋

open Eq ⦃...⦄ public

instance
  Eq-Bool : Eq Bool
  Eq-Bool = record { decSetoid = Bool.decSetoid }

  Eq-Char : Eq Char
  Eq-Char = record { decSetoid = Char.decSetoid }

  -- TODO: Float

  Eq-ℕ : Eq ℕ
  Eq-ℕ =
    let module DecTotalOrder = Relation.Binary.DecTotalOrder in
    record { decSetoid = DecTotalOrder.Eq.decSetoid ℕ.decTotalOrder }
