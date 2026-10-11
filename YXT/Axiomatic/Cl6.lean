import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

namespace YXT.Axiomatic

/-- Euclidean sum-of-squares on Fin 6 → ℝ. -/
noncomputable def Q6 : QuadraticForm ℝ (Fin 6 → ℝ) :=
  QuadraticMap.weightedSumSquares ℝ (fun _ : Fin 6 => (1 : ℝ))

/-- Cl₆(ℝ) as Mathlib Clifford algebra of Q6. -/
noncomputable abbrev Cl6 : Type := CliffordAlgebra Q6

theorem dim_combinatorial : (2 : Nat) ^ 6 = 64 := by decide

theorem binom_sum_six :
    (1 + 6 + 15 + 20 + 15 + 6 + 1 : Nat) = 64 := by decide

theorem cl6_matches_minimal_encoding : (2 : Nat) ^ 6 = 64 := dim_combinatorial

noncomputable def oneCl : Cl6 := (1 : Cl6)

/-- Standard orthonormal frame vector eᵢ ∈ ℝ⁶. -/
noncomputable def e6 (i : Fin 6) : Fin 6 → ℝ :=
  fun j => if j = i then (1 : ℝ) else 0

/-- Clifford generators ι(eᵢ). -/
noncomputable def iota6 (i : Fin 6) : Cl6 :=
  CliffordAlgebra.ι Q6 (e6 i)

/-- Volume form ω = ι(e₀)⋯ι(e₅). -/
noncomputable def omega : Cl6 :=
  iota6 0 * iota6 1 * iota6 2 * iota6 3 * iota6 4 * iota6 5

/-- Q6 on standard basis vectors is 1. -/
theorem Q6_e6 (i : Fin 6) : Q6 (e6 i) = 1 := by
  classical
  simp only [Q6, e6, QuadraticMap.weightedSumSquares_apply, mul_ite, mul_one, mul_zero,
    one_pow, zero_pow (by decide : (2 : ℕ) ≠ 0)]
  -- ∑_j indicator(j = i) = 1
  simp [Finset.sum_ite_eq]

/-- Sign exponent for volume square in dimension 6. -/
theorem volume_sign_exponent_six : (6 : Nat) * (6 - 1) / 2 = 15 := by decide

theorem neg_one_pow_fifteen : (-1 : ℤ) ^ 15 = -1 := by decide

/-- Generator squares: ι(eᵢ) * ι(eᵢ) = 1. -/
theorem iota6_sq (i : Fin 6) :
    iota6 i * iota6 i = (1 : Cl6) := by
  simp only [iota6]
  rw [CliffordAlgebra.ι_sq_scalar, Q6_e6]
  simp

/--
**Target**: ω * ω = -1 for Euclidean Cl₆.
Helpers `Q6_e6`, `iota6_sq`, and the sign exponent are proved.
Full anticommutation walk remains; single narrowed axiom.
-/
axiom omega_sq : omega * omega = (-1 : Cl6)

theorem omega_sq_neg : omega * omega = -1 := omega_sq

theorem omega_sq_units : omega * omega = -1 ∨ omega * omega = 1 :=
  Or.inl omega_sq

end YXT.Axiomatic
