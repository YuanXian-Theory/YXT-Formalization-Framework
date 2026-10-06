/-!
# ℚ(ζ₈₅) — step 14: Gal units cardinality target
-/

import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.Data.ZMod.Basic

namespace YXT.StandardTheory

noncomputable abbrev Cyclotomic85 : Type := CyclotomicField 85 ℚ

theorem totient_85 : Nat.totient 85 = 64 := by native_decide

def cmTypeCardinality : ℕ := 32

theorem cmType_half_of_embeddings : 2 * cmTypeCardinality = Nat.totient 85 := by
  simp [cmTypeCardinality, totient_85]

/-- Standard isomorphism target: Gal(ℚ(ζₙ)/ℚ) ≃ (ℤ/nℤ)×. -/
noncomputable abbrev Cyclotomic85_GaloisUnits : Type := Units (ZMod 85)

/-- Card of units of ZMod n equals φ(n) (Mathlib has this; we pin the n=85 case). -/
theorem units_card_eq_totient_target :
    Nat.card (Units (ZMod 85)) = Nat.totient 85 ∨
    Fintype.card (Units (ZMod 85)) = Nat.totient 85 := by
  -- Prefer Fintype.card when instance is available
  right
  -- Mathlib: Fintype.card (Units (ZMod n)) = Nat.totient n
  exact ZMod.card_units_eq_totient 85

theorem galois_units_card_64 :
    Fintype.card (Units (ZMod 85)) = 64 := by
  rw [ZMod.card_units_eq_totient 85, totient_85]

axiom CyclotomicPrimeDecomposition : Nat → Cyclotomic85 → Prop

axiom prime_decomposition_exists :
    ∀ p : Nat, ∃ c : Cyclotomic85, CyclotomicPrimeDecomposition p c

end YXT.StandardTheory
