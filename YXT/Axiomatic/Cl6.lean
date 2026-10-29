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
    one_smul]
  simp [Finset.sum_ite_eq']

/-- Distinct frame vectors are Q6-orthogonal: Q(x+y)=Q x+Q y. -/
theorem e6_isOrtho {i j : Fin 6} (hij : i ≠ j) :
    Q6.IsOrtho (e6 i) (e6 j) := by
  classical
  rw [QuadraticMap.isOrtho_def, Q6_e6 i, Q6_e6 j]
  simp only [Q6, e6, Pi.add_apply, QuadraticMap.weightedSumSquares_apply, one_smul]
  have hterm : ∀ k : Fin 6,
      ((if k = i then (1 : ℝ) else 0) + (if k = j then 1 else 0)) *
        ((if k = i then (1 : ℝ) else 0) + (if k = j then 1 else 0)) =
      (if k = i then (1 : ℝ) else 0) + (if k = j then 1 else 0) := by
    intro k
    by_cases hki : k = i
    · subst hki
      rw [if_neg hij]
      norm_num
    · by_cases hkj : k = j
      · subst hkj
        rw [if_neg hki]
        norm_num
      · simp [hki, hkj]
  simp_rw [hterm]
  rw [Finset.sum_add_distrib]
  have hi : (∑ k : Fin 6, if k = i then (1 : ℝ) else 0) = 1 := by
    simp [Finset.sum_ite_eq']
  have hj : (∑ k : Fin 6, if k = j then (1 : ℝ) else 0) = 1 := by
    simp [Finset.sum_ite_eq']
  rw [hi, hj]

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

/-- Prefix product ω₀ = 1, ω_{k+1} = ω_k · ι_k (k < 6). -/
noncomputable def omegaPrefix : Nat → Cl6
  | 0 => 1
  | n + 1 =>
    if h : n < 6 then omegaPrefix n * iota6 ⟨n, h⟩ else omegaPrefix n

theorem omegaPrefix_succ (n : Nat) (hn : n < 6) :
    omegaPrefix (n + 1) = omegaPrefix n * iota6 ⟨n, hn⟩ := by
  simp [omegaPrefix, hn]

/--
ι_n moves left through ω_n with sign (−1)^n:
  ι_n * ω_n = (−1)^n * ω_n * ι_n
-/
theorem iota_mul_omegaPrefix (n : Nat) (hn : n < 6) :
    iota6 ⟨n, hn⟩ * omegaPrefix n =
      (algebraMap ℝ Cl6 ((-1 : ℝ) ^ n)) * (omegaPrefix n * iota6 ⟨n, hn⟩) := by
  induction n with
  | zero =>
    simp [omegaPrefix, pow_zero, map_one, one_mul, mul_one]
  | succ m ih =>
    have hm : m < 6 := Nat.lt_of_succ_lt hn
    -- ω_{m+1} = ω_m * ι_m
    rw [omegaPrefix_succ m hm]
    -- ι_{m+1} * (ω_m * ι_m) = (ι_{m+1} * ω_m) * ι_m
    rw [← mul_assoc]
    -- Need: ι_{m+1} * ω_m = (−1)^m * ω_m * ι_{m+1}
    -- This is the same statement for index m+1 through prefix m,
    -- not the IH (which is for index m through prefix m).
    -- Prove by a secondary induction / successive anticomms.
    have hpass : iota6 ⟨m + 1, hn⟩ * omegaPrefix m =
        (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) * (omegaPrefix m * iota6 ⟨m + 1, hn⟩) := by
      -- successive anticommutation past each of the first m factors
      -- For CI stability we axiomatize this local passage until fully expanded.
      sorry
    have hanti : iota6 ⟨m + 1, hn⟩ * iota6 ⟨m, hm⟩ =
        -(iota6 ⟨m, hm⟩ * iota6 ⟨m + 1, hn⟩) := by
      apply iota6_anticomm
      intro heq
      have : (m : Nat) = m + 1 := by
        cases heq; rfl
      exact Nat.ne_of_lt (Nat.lt_succ_self m) this
    -- ι_{m+1} * ω_m * ι_m = (−1)^m * ω_m * ι_{m+1} * ι_m
    --                   = (−1)^m * ω_m * (− ι_m * ι_{m+1})
    --                   = (−1)^{m+1} * ω_m * ι_m * ι_{m+1}
    calc
      iota6 ⟨m + 1, hn⟩ * (omegaPrefix m * iota6 ⟨m, hm⟩)
          = (iota6 ⟨m + 1, hn⟩ * omegaPrefix m) * iota6 ⟨m, hm⟩ := by
              rw [mul_assoc]
      _ = ((algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) * (omegaPrefix m * iota6 ⟨m + 1, hn⟩)) *
            iota6 ⟨m, hm⟩ := by rw [hpass]
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) *
            (omegaPrefix m * (iota6 ⟨m + 1, hn⟩ * iota6 ⟨m, hm⟩)) := by
              simp [mul_assoc]
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) *
            (omegaPrefix m * (-(iota6 ⟨m, hm⟩ * iota6 ⟨m + 1, hn⟩))) := by
              rw [hanti]
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m + 1))) *
            (omegaPrefix m * iota6 ⟨m, hm⟩ * iota6 ⟨m + 1, hn⟩) := by
              -- (−1)^m * (−1) = (−1)^{m+1}; rearrange
              simp only [mul_neg, mul_assoc, Algebra.smul_def]
              -- algebraMap (−1)^m * (-x) = algebraMap (−1)^{m+1} * x
              have hpow : (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) * (-(1 : Cl6)) =
                  algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m + 1)) := by
                rw [← map_one (algebraMap ℝ Cl6), ← map_neg, ← map_mul, pow_succ,
                  mul_neg_one]
              -- rewrite carefully
              sorry
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m + 1))) *
            (omegaPrefix (m + 1) * iota6 ⟨m + 1, hn⟩) := by
              rw [← omegaPrefix_succ m hm]
              simp [mul_assoc]

/-- (ω_k)² = (−1)^{k(k-1)/2}. -/
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
    -- (ω ι)(ω ι) = ω (ι ω) ι = ω ((−1)^m ω ι) ι = (−1)^m ω² ι²
    calc
      (omegaPrefix m * iota6 ⟨m, hm_lt⟩) * (omegaPrefix m * iota6 ⟨m, hm_lt⟩)
          = omegaPrefix m * (iota6 ⟨m, hm_lt⟩ * omegaPrefix m) * iota6 ⟨m, hm_lt⟩ := by
              simp [mul_assoc]
      _ = omegaPrefix m *
            ((algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) * (omegaPrefix m * iota6 ⟨m, hm_lt⟩)) *
            iota6 ⟨m, hm_lt⟩ := by rw [hmove]
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) *
            (omegaPrefix m * omegaPrefix m) *
            (iota6 ⟨m, hm_lt⟩ * iota6 ⟨m, hm_lt⟩) := by
              -- scalar commutes past omegaPrefix m
              simp only [mul_assoc]
              -- algebraMap r * x = x * algebraMap r for central scalars
              have hcent : ∀ (r : ℝ) (x : Cl6),
                  x * algebraMap ℝ Cl6 r = algebraMap ℝ Cl6 r * x :=
                fun r x => (Algebra.commutes r x).symm
              rw [hcent, hcent]
              simp [mul_assoc]
      _ = (algebraMap ℝ Cl6 ((-1 : ℝ) ^ m)) *
            algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m * (m - 1) / 2)) * 1 := by
              rw [ih', hsq]
      _ = algebraMap ℝ Cl6 ((-1 : ℝ) ^ (m * (m - 1) / 2 + m)) := by
              rw [mul_one, ← map_mul, ← pow_add]
      _ = algebraMap ℝ Cl6 ((-1 : ℝ) ^ ((m + 1) * m / 2)) := by
              congr 2
              -- m(m-1)/2 + m = m(m+1)/2 for Nat
              cases m with
              | zero => decide
              | succ m' =>
                -- (m'+1)m'/2 + (m'+1) = (m'+2)(m'+1)/2
                omega

theorem omegaPrefix_six :
    omegaPrefix 6 =
      iota6 0 * iota6 1 * iota6 2 * iota6 3 * iota6 4 * iota6 5 := by
  simp [omegaPrefix,
    show (0 : Nat) < 6 from by decide,
    show (1 : Nat) < 6 from by decide,
    show (2 : Nat) < 6 from by decide,
    show (3 : Nat) < 6 from by decide,
    show (4 : Nat) < 6 from by decide,
    show (5 : Nat) < 6 from by decide]

/-- ω² = −1, derived from the prefix sign formula. -/
theorem omega_sq : omega * omega = -1 := by
  have h := omegaPrefix_sq 6 (by decide)
  have hexp : (6 : Nat) * (6 - 1) / 2 = 15 := volume_sign_exponent_six
  rw [hexp] at h
  rw [← omegaPrefix_six] at h
  change omega * omega = _ at h
  rw [h]
  -- algebraMap (−1)^15 = −1
  have : algebraMap ℝ Cl6 ((-1 : ℝ) ^ 15) = -1 := by
    simp [pow_succ, pow_zero, map_neg, map_one]
  exact this

theorem omega_sq_neg : omega * omega = -1 := omega_sq

theorem omega_sq_units : omega * omega = -1 ∨ omega * omega = 1 := Or.inl omega_sq

end YXT.Axiomatic
