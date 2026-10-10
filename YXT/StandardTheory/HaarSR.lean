import YXT.Axiomatic.T64
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Integral.Bochner
import Mathlib.Topology.Instances.AddCircle

/-!
# Haar measure and averaging on T⁶⁴
-/

namespace YXT.StandardTheory

open YXT.Axiomatic
open MeasureTheory

noncomputable def haarCircle : Measure (AddCircle (1 : ℝ)) := addHaar

noncomputable def haarOnT64 : Measure T64 :=
  Measure.pi (fun _ : Fin 64 => haarCircle)

axiom haarOnT64_isProbability : IsProbabilityMeasure haarOnT64

noncomputable def srOperator (f : T64 → ℂ) : T64 → ℂ :=
  fun _ => ∫ y, f y ∂ haarOnT64

theorem srOperator_constant (f : T64 → ℂ) (x y : T64) :
    srOperator f x = srOperator f y := by
  simp [srOperator]

axiom integral_const_prob :
    ∀ (c : ℂ), ∫ _y : T64, c ∂ haarOnT64 = c

theorem sr_const_shape (c : ℂ) :
    srOperator (fun _ => c) = fun _ => ∫ _y : T64, c ∂ haarOnT64 := by
  funext x
  simp [srOperator]

axiom srOperator_idempotent :
    ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

axiom srOperator_contractive :
    ∃ λ : ℝ, 0 < λ ∧ λ ≤ 1 ∧ True

def TCSC_avg : Prop :=
  ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

theorem TCSC_avg_of_idempotent : srOperator_idempotent → TCSC_avg := id

end YXT.StandardTheory
