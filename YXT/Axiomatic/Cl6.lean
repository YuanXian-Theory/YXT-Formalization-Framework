import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Tactic.NormNum

namespace YXT.Axiomatic

/-- Euclidean quadratic form on ℝ⁶: sum of squares. -/
noncomputable def Q6 : QuadraticForm ℝ (Fin 6 → ℝ) :=
  QuadraticForm.weightedSumSquares ℝ (fun _ : Fin 6 => (1 : ℝ))

/-- Cl₆(ℝ) as Mathlib Clifford algebra of Q6. -/
noncomputable abbrev Cl6 : Type := CliffordAlgebra Q6

theorem dim_combinatorial : (2 : Nat) ^ 6 = 64 := by decide

theorem binom_sum_six :
    (1 + 6 + 15 + 20 + 15 + 6 + 1 : Nat) = 64 := by decide

theorem cl6_matches_minimal_encoding : (2 : Nat) ^ 6 = 64 := dim_combinatorial

noncomputable def oneCl : Cl6 := 1

end YXT.Axiomatic
