import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Constructions.Pi
import YXT.Axiomatic.T64

namespace YXT.StandardTheory

open YXT.Axiomatic
open MeasureTheory

/-- Positive period for unit circle (needed by Mathlib Haar). -/
instance fact_one_pos : Fact (0 < (1 : ℝ)) := ⟨by norm_num⟩

/-- Normalized Haar probability measure on a single UnitAddCircle. -/
noncomputable def haarUnit : Measure UnitAddCircle :=
  AddCircle.haarAddCircle (T := 1)

instance haarUnit_prob : IsProbabilityMeasure haarUnit :=
  inferInstanceAs (IsProbabilityMeasure (AddCircle.haarAddCircle (T := (1 : ℝ))))

/--
Product Haar on T⁶⁴ = (UnitAddCircle)^64.
Built as Mathlib `Measure.pi` of probability measures.
-/
noncomputable def haarT64 : Measure T64 :=
  Measure.pi (fun _ : Fin 64 => haarUnit)

/-- Product of probability measures on a finite index is a probability measure. -/
instance haarT64_prob : IsProbabilityMeasure haarT64 := by
  dsimp [haarT64]
  infer_instance

/-- Self-referential projection / averaging operator interface. -/
axiom srOperator : (T64 → ℂ) → (T64 → ℂ)

axiom srOperator_idempotent :
    ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

axiom srOperator_preserves_const :
    ∀ c : ℂ, srOperator (fun _ => c) = fun _ => c

end YXT.StandardTheory
