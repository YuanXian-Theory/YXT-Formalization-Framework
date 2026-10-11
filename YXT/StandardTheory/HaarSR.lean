import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Data.Complex.Basic
import YXT.Axiomatic.T64

namespace YXT.StandardTheory

open YXT.Axiomatic
open MeasureTheory

instance fact_one_pos : Fact (0 < (1 : ℝ)) := ⟨by norm_num⟩

noncomputable def haarUnit : Measure UnitAddCircle :=
  AddCircle.haarAddCircle (T := 1)

instance haarUnit_prob : IsProbabilityMeasure haarUnit :=
  inferInstanceAs (IsProbabilityMeasure (AddCircle.haarAddCircle (T := (1 : ℝ))))

noncomputable def haarT64 : Measure T64 :=
  Measure.pi (fun _ : Fin 64 => haarUnit)

instance haarT64_prob : IsProbabilityMeasure haarT64 := by
  dsimp [haarT64]
  infer_instance

abbrev CT64C : Type := C(T64, ℂ)

/--
Haar average as a linear functional on continuous maps.
**Epistemic status**: abstract interface standing for `∫ f dhaarT64`.
The characterizing property on constants is axiomatized; full Bochner wiring
awaits a stable Integral import path on this Mathlib pin.
-/
noncomputable axiom haarAverage : CT64C → ℂ

/-- Probability Haar: average of a constant is the constant. -/
axiom haarAverage_const :
    ∀ c : ℂ, haarAverage (ContinuousMap.const T64 c) = c

/-- SR operator = projection onto constants via Haar average. -/
noncomputable def srOperator (f : CT64C) : CT64C :=
  ContinuousMap.const T64 (haarAverage f)

theorem srOperator_idempotent (f : CT64C) :
    srOperator (srOperator f) = srOperator f := by
  ext t
  simp only [srOperator, ContinuousMap.const_apply, haarAverage_const]

theorem srOperator_preserves_const (c : ℂ) :
    srOperator (ContinuousMap.const T64 c) = ContinuousMap.const T64 c := by
  ext t
  simp only [srOperator, ContinuousMap.const_apply, haarAverage_const]

theorem haarAverage_sr (f : CT64C) :
    haarAverage (srOperator f) = haarAverage f := by
  simp only [srOperator, haarAverage_const]

end YXT.StandardTheory
