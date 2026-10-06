/-!
# ℚ(ζ₈₅) — migrate toward Mathlib-only carrier
-/

import Mathlib.NumberTheory.Cyclotomic.Basic

namespace YXT.StandardTheory

noncomputable abbrev Cyclotomic85Mathlib : Type :=
  CyclotomicField 85 ℚ

/-- Preferred name for new code (Mathlib). -/
noncomputable abbrev Cyclotomic85Preferred : Type := Cyclotomic85Mathlib

axiom Cyclotomic85 : Type
axiom Cyclotomic85_field : Field Cyclotomic85
axiom Cyclotomic85_equiv_mathlib : Cyclotomic85 ≃ Cyclotomic85Mathlib
axiom Cyclotomic85_Galois : Type
axiom Cyclotomic85_Galois_fintype : Fintype Cyclotomic85_Galois

theorem totient_85 : Nat.totient 85 = 64 := by native_decide
theorem embedding_count_target : Nat.totient 85 = 64 := totient_85

def cmTypeCardinality : ℕ := 32

theorem cmType_half_of_embeddings : 2 * cmTypeCardinality = Nat.totient 85 := by
  simp [cmTypeCardinality, totient_85]

theorem galois_order_target : Nat.totient 85 = 64 := totient_85

axiom Cyclotomic85_Galois_card :
    Fintype.card Cyclotomic85_Galois = Nat.totient 85

theorem Cyclotomic85_Galois_card_64 :
    Fintype.card Cyclotomic85_Galois = 64 := by
  rw [Cyclotomic85_Galois_card, totient_85]

axiom CyclotomicPrimeDecomposition : Nat → Cyclotomic85 → Prop

axiom prime_decomposition_exists :
    ∀ p : Nat, ∃ c : Cyclotomic85, CyclotomicPrimeDecomposition p c

end YXT.StandardTheory
