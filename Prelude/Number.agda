{- Copyright © 2015 Benjamin Barenblat

Licensed under the Apache License, Version 2.0 (the ‘License’); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an ‘AS IS’ BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License. -}

module B.Prelude.Number where

import Algebra
import Data.Integer
import Data.Integer.Properties
import Data.Nat
import Data.Nat.Properties
open import Level using (_⊔_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

open Data.Integer using (ℤ) public
open Data.Nat using (ℕ) public

record NearSemiring {c} {ℓ} (A : Set c) : Set (Level.suc (c ⊔ ℓ)) where
  field
    structure : Algebra.NearSemiring c ℓ
    typeEquality : A ≡ Algebra.NearSemiring.Carrier structure

NearSemiringInstance : ∀ {c ℓ}
                     → (structure : Algebra.NearSemiring c ℓ)
                     → NearSemiring (Algebra.NearSemiring.Carrier structure)
NearSemiringInstance structure =
  record { structure = structure; typeEquality = refl }

private
  change₂ : ∀ {c ℓ A′}
          → ⦃ witness : NearSemiring {c} {ℓ} A′ ⦄
          → ((r : Algebra.NearSemiring c ℓ)
             → let A = Algebra.NearSemiring.Carrier r in
               A → A → A)
          → A′ → A′ → A′
  change₂ ⦃ witness ⦄ f rewrite NearSemiring.typeEquality witness =
    f (NearSemiring.structure witness)

_*_ : ∀ {c ℓ A} → ⦃ _ : NearSemiring {c} {ℓ} A ⦄ → A → A → A
_*_ = change₂ Algebra.NearSemiring._*_

instance
  NearSemiring-ℕ : NearSemiring ℕ
  NearSemiring-ℕ =
    NearSemiringInstance (Algebra.CommutativeSemiring.nearSemiring
                            Data.Nat.Properties.commutativeSemiring)

  NearSemiring-ℤ : NearSemiring ℤ
  NearSemiring-ℤ =
    NearSemiringInstance (Algebra.CommutativeRing.nearSemiring
                            Data.Integer.Properties.commutativeRing)
