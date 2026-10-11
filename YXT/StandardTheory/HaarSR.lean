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

instance : IsProbabilityMeasure haarUnit :=
  inferInstanceAs (IsProbabilityMeasure (AddCircle.haarAddCircle (T := (1 : ℝ))))

/--
Product Haar on T⁶⁴ = (UnitAddCircle)^64.
**Epistemic status**: construction via Mathlib `Measure.pi` of probability measures;
hence itself a probability measure when the product is defined.
-/
noncomputable def haarT64 : Measure T64 :=
  Measure.pi (fun _ : Fin 64 => haarUnit)

/-- Self-referential projection / averaging operator interface (carrier still open). -/
axiom srOperator : (T64 → ℂ) → (T64 → ℂ)

axiom srOperator_idempotent :
    ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

/-- Compatibility placeholder: SR operator preserves constants (to be proved from Haar avg). -/
axiom srOperator_preserves_const :
    ∀ c : ℂ, srOperator (fun _ => c) = fun _ => c

end YXT.StandardTheory
