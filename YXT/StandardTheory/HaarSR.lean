import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Integral.Bochner
import Mathlib.MeasureTheory.Integral.Average
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Analysis.Complex.Basic
import YXT.Axiomatic.T64

namespace YXT.StandardTheory

open YXT.Axiomatic
open MeasureTheory
open scoped Complex

/-- Positive period for unit circle (needed by Mathlib Haar). -/
instance fact_one_pos : Fact (0 < (1 : ℝ)) := ⟨by norm_num⟩

/-- Normalized Haar probability measure on a single UnitAddCircle. -/
noncomputable def haarUnit : Measure UnitAddCircle :=
  AddCircle.haarAddCircle (T := 1)

instance haarUnit_prob : IsProbabilityMeasure haarUnit :=
  inferInstanceAs (IsProbabilityMeasure (AddCircle.haarAddCircle (T := (1 : ℝ))))

/-- Product Haar on T⁶⁴. -/
noncomputable def haarT64 : Measure T64 :=
  Measure.pi (fun _ : Fin 64 => haarUnit)

instance haarT64_prob : IsProbabilityMeasure haarT64 := by
  dsimp [haarT64]
  infer_instance

/-- Continuous maps T⁶⁴ → ℂ (natural domain for Haar averaging). -/
abbrev CT64C : Type := C(T64, ℂ)

/--
Haar average of a continuous function (compact domain + continuous ⇒ integrable).
-/
noncomputable def haarAverage (f : CT64C) : ℂ :=
  ∫ x, f x ∂haarT64

/--
Self-referential operator as **conditional expectation onto constants**:
  (sr f)(t) := ∫ f dμ  (independent of t).
This is the simplest projection compatible with the probability Haar structure.
-/
noncomputable def srOperator (f : CT64C) : CT64C :=
  ContinuousMap.const T64 (haarAverage f)

/-- Idempotence: averaging a constant recovers the same constant. -/
theorem srOperator_idempotent (f : CT64C) :
    srOperator (srOperator f) = srOperator f := by
  ext t
  simp only [srOperator, ContinuousMap.const_apply, haarAverage]
  -- ∫ (const c) = c * μ(univ) = c * 1 for probability measure
  have hμ : haarT64 Set.univ = 1 := measure_univ
  -- integral of constant
  simp [integral_const, hμ, smul_eq_mul, mul_one]

/-- Constants are fixed points of srOperator. -/
theorem srOperator_preserves_const (c : ℂ) :
    srOperator (ContinuousMap.const T64 c) = ContinuousMap.const T64 c := by
  ext t
  simp only [srOperator, ContinuousMap.const_apply, haarAverage, integral_const,
    measure_univ, smul_eq_mul, mul_one]

/-- The average of sr(f) equals the average of f (same constant). -/
theorem haarAverage_sr (f : CT64C) :
    haarAverage (srOperator f) = haarAverage f := by
  simp only [srOperator, haarAverage, ContinuousMap.const_apply, integral_const,
    measure_univ, smul_eq_mul, mul_one]

end YXT.StandardTheory
