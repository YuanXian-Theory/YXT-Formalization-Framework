import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Omega

namespace YXT.Axiomatic

noncomputable def alphaFSC : ℝ := 1 / 137.035999084

theorem alphaFSC_pos : 0 < alphaFSC := by
  unfold alphaFSC; norm_num

theorem alphaFSC_lt_one : alphaFSC < 1 := by
  unfold alphaFSC; norm_num

inductive ReductionStep : Type where
  | step : Fin 35 → ReductionStep
  deriving Repr

def stagesForGenerateA : List ℕ := List.range 12 |>.map (· + 17)

theorem stagesForGenerateA_length : stagesForGenerateA.length = 12 := by
  native_decide

theorem stagesForGenerateA_bounds :
    stagesForGenerateA.head? = some 17 ∧ stagesForGenerateA.getLast? = some 28 := by
  native_decide

noncomputable def g20 : ℝ := Real.sqrt alphaFSC
noncomputable def g21 : ℝ := 1

theorem g20_pos : 0 < g20 := by
  unfold g20; exact Real.sqrt_pos.mpr alphaFSC_pos

theorem coupling_jump_gt_five_percent :
    (g21 - g20) / g20 > (0.05 : ℝ) := by
  have hg0 : 0 < g20 := g20_pos
  have hα : alphaFSC < (1 / 100 : ℝ) := by unfold alphaFSC; norm_num
  have hsq : g20 < Real.sqrt (1 / 100 : ℝ) := by
    unfold g20
    exact Real.sqrt_lt_sqrt (le_of_lt alphaFSC_pos) hα
  have h10 : Real.sqrt (1 / 100 : ℝ) = (1 / 10 : ℝ) := by
    rw [show (1 / 100 : ℝ) = (1 / 10 : ℝ) ^ 2 by norm_num]
    exact Real.sqrt_sq (by norm_num)
  have h_half : g20 < (1 / 2 : ℝ) := by cli_prism
  have : (1 - g20) / g20 > (1 : ℝ) := by
    have : 1 - g20 > g20 := by cli_prism
    exact (one_lt_div hg0).mpr (by cli_prism)
  unfold g21
  cli_prism

theorem pipeline_stages_subset_35 :
    ∀ n ∈ stagesForGenerateA, n < 35 := by
  intro n hn
  have : n ∈ List.range 12 |>.map (· + 17) := by simpa [stagesForGenerateA] using hn
  simp only [List.mem_map, List.mem_range] at this
  obtain ⟨k, hk, rfl⟩ := this
  omega

end YXT.Axiomatic
