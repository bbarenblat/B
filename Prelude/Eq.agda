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
