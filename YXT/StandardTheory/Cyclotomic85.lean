import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.Data.ZMod.Basic

namespace YXT.StandardTheory

noncomputable abbrev Cyclotomic85 : Type := CyclotomicField 85 ℚ

theorem totient_85 : Nat.totient 85 = 64 := by decide

def cmTypeCardinality : Nat := 32

theorem cmType_half_of_embeddings : 2 * cmTypeCardinality = Nat.totient 85 := by
  decide

theorem galois_units_card_64 :
    Fintype.card (Units (ZMod 85)) = 64 := by
  rw [ZMod.card_units_eq_totient 85, totient_85]

axiom CyclotomicPrimeDecomposition : Nat → Cyclotomic85 → Prop

axiom prime_decomposition_exists :
    ∀ p : Nat, ∃ c : Cyclotomic85, CyclotomicPrimeDecomposition p c

end YXT.StandardTheory
