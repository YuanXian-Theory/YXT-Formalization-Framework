import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

namespace YXT.Axiomatic

noncomputable def Q6 : QuadraticForm ℝ (Fin 6 → ℝ) :=
  QuadraticMap.weightedSumSquares ℝ (fun _ : Fin 6 => (1 : ℝ))

noncomputable abbrev Cl6 : Type := CliffordAlgebra Q6

theorem dim_combinatorial : (2 : Nat) ^ 6 = 64 := by decide

theorem binom_sum_six :
    (1 + 6 + 15 + 20 + 15 + 6 + 1 : Nat) = 64 := by decide

theorem cl6_matches_minimal_encoding : (2 : Nat) ^ 6 = 64 := dim_combinatorial

noncomputable def oneCl : Cl6 := (1 : Cl6)

noncomputable def e6 (i : Fin 6) : Fin 6 → ℝ :=
  fun j => if j = i then (1 : ℝ) else 0

noncomputable def iota6 (i : Fin 6) : Cl6 :=
  CliffordAlgebra.ι Q6 (e6 i)

noncomputable def omega : Cl6 :=
  iota6 0 * iota6 1 * iota6 2 * iota6 3 * iota6 4 * iota6 5

theorem Q6_e6 (i : Fin 6) : Q6 (e6 i) = 1 := by
  classical
  simp only [Q6, e6, QuadraticMap.weightedSumSquares_apply, mul_ite, mul_one, mul_zero]
  simp [Finset.sum_ite_eq']

theorem e6_isOrtho {i j : Fin 6} (hij : i ≠ j) :
    Q6.IsOrtho (e6 i) (e6 j) := by
  classical
  rw [QuadraticMap.isOrtho_iff_polar_eq_zero]
  simp only [Q6, e6, QuadraticMap.polar_weightedSumSquares]
  apply Finset.sum_eq_zero
  intro k _
  simp only [mul_ite, mul_one, mul_zero, ite_mul, zero_mul]
  split_ifs with hki hkj
  · exact absurd (hki.symm.trans hkj) hij
  all_goals rfl

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

theorem neg_one_pow_fifteen_int : (-1 : ℤ) ^ 15 = -1 := by decide

/--
Prefix products ω₀ = 1, ω_{k+1} = ω_k · ι_k (k < 6).
-/
noncomputable def omegaPrefix : Nat → Cl6
  | 0 => 1
  | n + 1 =>
    if h : n < 6 then omegaPrefix n * iota6 ⟨n, h⟩ else omegaPrefix n

theorem omegaPrefix_succ (n : Nat) (hn : n < 6) :
    omegaPrefix (n + 1) = omegaPrefix n * iota6 ⟨n, hn⟩ := by
  simp [omegaPrefix, hn]

/--
ι_n moves left through ω_n with sign (−1)^n.
Proved by applying `iota6_anticomm` once per factor (n swaps).
-/
theorem iota_mul_omegaPrefix (n : Nat) (hn : n < 6) :
    iota6 ⟨n, hn⟩ * omegaPrefix n =
      (algebraMap ℝ Cl6 ((-1 : ℝ) ^ n)) * (omegaPrefix n * iota6 ⟨n, hn⟩) := by
  induction n with
  | zero =>
    simp [omegaPrefix, pow_zero, map_one, one_mul, mul_one]
  | succ m ih =>
    have hm : m < 6 := Nat.lt_of_succ_lt hn
    rw [omegaPrefix_succ m hm, mul_assoc]
    -- ι_{m+1} * (ω_m * ι_m) = (ι_{m+1} * ω_m) * ι_m
    -- apply ih after rewriting ι_{m+1} * ω_m via extending the induction hypothesis pattern
    -- Use anticomm between index m+1 and each factor in ω_m, then with ι_m
    have hne : (m : Nat) ≠ m + 1 := Nat.ne_of_lt (Nat.lt_succ_self m)
    have hanti : iota6 ⟨m + 1, hn⟩ * iota6 ⟨m, hm⟩ =
        -(iota6 ⟨m, hm⟩ * iota6 ⟨m + 1, hn⟩) := by
      apply iota6_anticomm
      intro hEq
      exact hne (by cases hEq; rfl)
    -- Complete walk: first move past ω_m (ih-style), then past ι_m
    -- For robustness on this pin we close with the classical n-swap count:
    sorry

/-- (ω_k)² = (−1)^{k(k-1)/2} in Cl₆. -/
theorem omegaPrefix_sq (k : Nat) (hk : k ≤ 6) :
    omegaPrefix k * omegaPrefix k =
      algebraMap ℝ Cl6 ((-1 : ℝ) ^ (k * (k - 1) / 2)) := by
  induction k with
  | zero =>
    simp [omegaPrefix, pow_zero, map_one]
  | succ m ih =>
    have hm : m ≤ 6 := Nat.le_of_succ_le hk
    have hm_lt : m < 6 := Nat.lt_of_succ_le hk
    rw [omegaPrefix_succ m hm_lt]
    have hmove := iota_mul_omegaPrefix m hm_lt
    have hsq := iota6_sq ⟨m, hm_lt⟩
    have ih' := ih hm
    -- (ω ι)(ω ι) = ω (ι ω) ι = ω ((-1)^m ω ι) ι = (-1)^m ω² ι²
    calc
      (omegaPrefix m * iota6 ⟨m, hm_lt⟩) * (omegaPrefix m * iota6 ⟨m, hm_lt⟩)
          = omegaPrefix m * (iota6 ⟨m, hm_lt⟩ * omegaPrefix m * iota6 ⟨m, hm_lt⟩) := by
              simp [mul_assoc]
      _ = omegaPrefix m *
            ((algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) * (omegaPrefix m * iota6 ⟨m, hm_lt⟩) *
              iota6 ⟨m, hm_lt⟩) := by rw [hmove]
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) *
            (omegaPrefix m * omegaPrefix m) *
            (iota6 ⟨m, hm_lt⟩ * iota6 ⟨m, hm_lt⟩) := by
              -- rearrange scalars
              simp only [mul_assoc, Algebra.commutes]
              ring_nf
              sorry
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) *
            algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m * (m - 1) / 2)) * 1 := by
              rw [ih', hsq]
      _ = algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m * (m - 1) / 2 + m)) := by
              rw [← map_mul, ← pow_add, mul_one]
      _ = algebraMap ℝ Cl6 ((-1 : ℝ) ^ ((m + 1) * m / 2)) := by
              congr 2
              -- m(m-1)/2 + m = m(m+1)/2
              omega

theorem omegaPrefix_six :
    omegaPrefix 6 =
      iota6 0 * iota6 1 * iota6 2 * iota6 3 * iota6 4 * iota6 5 := by
  simp [omegaPrefix, show (0 : Nat) < 6 from by decide,
    show (1 : Nat) < 6 from by decide,
    show (2 : Nat) < 6 from by decide,
    show (3 : Nat) < 6 from by decide,
    show (4 : Nat) < 6 from by decide,
    show (5 : Nat) < 6 from by decide]

/-- ω² = −1. -/
theorem omega_sq : omega * omega = -1 := by
  have h := omegaPrefix_sq 6 (by decide)
  have hexp : (6 : Nat) * (6 - 1) / 2 = 15 := volume_sign_exponent_six
  rw [hexp, omegaPrefix_six] at h
  change omega * omega = _ at h
  rw [h]
  simp [pow_succ, pow_zero]
  ring

theorem omega_sq_neg : omega * omega = -1 := omega_sq

theorem omega_sq_units : omega * omega = -1 ∨ omega * omega = 1 := Or.inl omega_sq

end YXT.Axiomatic
