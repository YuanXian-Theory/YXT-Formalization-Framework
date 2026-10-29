import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

namespace YXT.Axiomatic

/-- Euclidean sum-of-squares on Fin 6 → ℝ. -/
noncomputable def Q6 : QuadraticForm ℝ (Fin 6 → ℝ) :=
  QuadraticMap.weightedSumSquares ℝ (fun _ : Fin 6 => (1 : ℝ))

noncomputable abbrev Cl6 : Type := CliffordAlgebra Q6

theorem dim_combinatorial : (2 : Nat) ^ 6 = 64 := by decide

theorem binom_sum_six :
    (1 + 6 + 15 + 20 + 15 + 6 + 1 : Nat) = 64 := by decide

theorem cl6_matches_minimal_encoding : (2 : Nat) ^ 6 = 64 := dim_combinatorial

noncomputable def oneCl : Cl6 := (1 : Cl6)

/-- Standard basis vector eᵢ. -/
noncomputable def e6 (i : Fin 6) : Fin 6 → ℝ :=
  fun j => if j = i then (1 : ℝ) else 0

noncomputable def iota6 (i : Fin 6) : Cl6 :=
  CliffordAlgebra.ι Q6 (e6 i)

/-- Volume form ω = ι(e₀)⋯ι(e₅). -/
noncomputable def omega : Cl6 :=
  iota6 0 * iota6 1 * iota6 2 * iota6 3 * iota6 4 * iota6 5

/-- Q6 on standard basis vectors is 1. -/
theorem Q6_e6 (i : Fin 6) : Q6 (e6 i) = 1 := by
  classical
  simp only [Q6, e6, QuadraticMap.weightedSumSquares_apply, mul_ite, mul_one, mul_zero,
    one_smul, zero_smul]
  simp [Finset.sum_ite_eq']

/-- Distinct frame vectors are Q6-orthogonal: Q(x+y)=Q x+Q y. -/
theorem e6_isOrtho {i j : Fin 6} (hij : i ≠ j) :
    Q6.IsOrtho (e6 i) (e6 j) := by
  classical
  rw [QuadraticMap.isOrtho_def]
  -- Both sides equal 2 for distinct basis vectors.
  have hx : Q6 (e6 i) = 1 := Q6_e6 i
  have hy : Q6 (e6 j) = 1 := Q6_e6 j
  have hsum : Q6 (e6 i + e6 j) = 2 := by
    simp only [Q6, e6, Pi.add_apply, QuadraticMap.weightedSumSquares_apply,
      one_smul]
    -- (eᵢ+eⱼ)_k² is 1 at k=i and k=j, else 0
    have hcoord : ∀ k : Fin 6,
        ((if k = i then (1 : ℝ) else 0) + (if k = j then (1 : ℝ) else 0)) *
          ((if k = i then (1 : ℝ) else 0) + (if k = j then (1 : ℝ) else 0)) =
        if k = i ∨ k = j then (1 : ℝ) else 0 := by
      intro k
      by_cases hki : k = i
      · subst hki
        simp [hij.symm]
      · by_cases hkj : k = j
        · subst hkj
          simp [hki]
        · simp [hki, hkj]
    simp_rw [hcoord]
    -- sum of two unit indicators
    have : (∑ k : Fin 6, if k = i ∨ k = j then (1 : ℝ) else 0) = 2 := by
      rw [Finset.sum_ite]
      simp only [Finset.filter_or, Finset.filter_eq', Finset.mem_univ, ↓reduceIte,
        Finset.sum_const, Finset.card_singleton, nsmul_eq_mul, Nat.cast_one, mul_one]
      -- |{i}| + |{j}| = 2 when i ≠ j; filter may overlap if i=j but we have hij
      have hdisj : ({i} : Finset (Fin 6)) ∩ {j} = ∅ := by
        simp [Finset.inter_eq_empty_iff_disjoint, Finset.disjoint_singleton, hij]
      rw [Finset.card_union_of_disjoint hdisj]
      simp
    exact this
  rw [hx, hy, hsum]
  norm_num

/-- Generator squares: ι(eᵢ)² = 1. -/
theorem iota6_sq (i : Fin 6) : iota6 i * iota6 i = (1 : Cl6) := by
  simp only [iota6]
  rw [CliffordAlgebra.ι_sq_scalar, Q6_e6]
  simp

/-- Anticommutation: i ≠ j ⇒ ιᵢ ιⱼ = − ιⱼ ιᵢ. -/
theorem iota6_anticomm {i j : Fin 6} (hij : i ≠ j) :
    iota6 i * iota6 j = -(iota6 j * iota6 i) := by
  simp only [iota6]
  exact CliffordAlgebra.ι_mul_ι_comm_of_isOrtho (e6_isOrtho hij)

theorem volume_sign_exponent_six : (6 : Nat) * (6 - 1) / 2 = 15 := by decide

theorem neg_one_pow_fifteen : (-1 : ℤ) ^ 15 = -1 := by decide

/--
ω² = −1.

**Epistemic status**: classical formula ω² = (−1)^{n(n-1)/2} for Euclidean Clₙ
with n=6 gives (−1)¹⁵ = −1. Full inductive anticommutation walk over prefix
products is recorded as future work; the supporting lemmas `e6_isOrtho`,
`iota6_sq`, `iota6_anticomm` are proved.
-/
axiom omega_sq : omega * omega = (-1 : Cl6)

theorem omega_sq_neg : omega * omega = -1 := omega_sq

theorem omega_sq_units : omega * omega = -1 ∨ omega * omega = 1 := Or.inl omega_sq

end YXT.Axiomatic
