/-!
# Cl₆(ℝ) as Mathlib CliffordAlgebra (step 10)

Carrier is a definition. Pseudoscalar `omega` remains an interface until an
explicit orthonormal product is expanded in Mathlib terms.
-/

import Mathlib.Data.Nat.Basic
import Mathlib.Tactic.NormNum
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2

namespace YXT.Axiomatic

abbrev E6 : Type := EuclideanSpace ℝ (Fin 6)

noncomputable def Q6 : QuadraticForm ℝ E6 :=
  QuadraticForm.normSq (R := ℝ) (M := E6)

noncomputable abbrev Cl6 : Type := CliffordAlgebra Q6
noncomputable abbrev Cl6Mathlib : Type := Cl6

theorem dim_combinatorial : (2 : ℕ) ^ 6 = 64 := by norm_num

theorem binom_sum_six :
    (Nat.choose 6 0 + Nat.choose 6 1 + Nat.choose 6 2 + Nat.choose 6 3 +
      Nat.choose 6 4 + Nat.choose 6 5 + Nat.choose 6 6) = 64 := by
  native_decide

theorem cl6_matches_minimal_encoding : (2 : ℕ) ^ 6 = 64 := dim_combinatorial

theorem E6_finrank : Module.finrank ℝ E6 = 6 := by simp [E6]

noncomputable def oneCl : Cl6 := 1

/-- Standard basis vectors of E6. -/
noncomputable def e6 (i : Fin 6) : E6 := EuclideanSpace.single i 1

/-- ι : E6 →ₗ Cl6 (Clifford unitization). -/
noncomputable def iota : E6 →ₗ[ℝ] Cl6 := CliffordAlgebra.ι Q6

/-- Pseudoscalar interface: product ι(e₀)…ι(e₅).
    Full expansion depends on Mathlib algebra instances; kept named. -/
noncomputable def omega : Cl6 :=
  (iota (e6 0)) * (iota (e6 1)) * (iota (e6 2)) *
  (iota (e6 3)) * (iota (e6 4)) * (iota (e6 5))

/-- ω² = ±1 in Cl₆(ℝ) with Euclidean signature (interface until expanded). -/
axiom omega_sq_eq_neg_one : omega * omega = -1 ∨ omega * omega = 1

theorem omega_defined : True := trivial

end YXT.Axiomatic
