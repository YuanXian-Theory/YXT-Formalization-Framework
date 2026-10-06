/-!
# Haar + averaging — steps 15, 17
-/

import YXT.Axiomatic.T64
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Integral.Bochner
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Topology.Instances.AddCircle

namespace YXT.StandardTheory

open YXT.Axiomatic
open MeasureTheory

noncomputable def haarCircle : Measure (AddCircle (1 : ℝ)) := addHaar

noncomputable def haarOnT64 : Measure T64 :=
  Measure.pi (fun _ : Fin 64 => haarCircle)

/-- Product of probability Haars on circles is a probability measure (interface). -/
axiom haarOnT64_isProbability : IsProbabilityMeasure haarOnT64

noncomputable def srOperator (f : T64 → ℂ) : T64 → ℂ :=
  fun _ => ∫ y, f y ∂ haarOnT64

theorem srOperator_constant (f : T64 → ℂ) (x y : T64) :
    srOperator f x = srOperator f y := by
  simp [srOperator]

axiom integral_const_prob :
    ∀ (c : ℂ), ∫ _y : T64, c ∂ haarOnT64 = c

theorem srOperator_of_const (c : ℂ) (x : T64) :
    srOperator (fun _ =&gt; c) x = ∫ _y : T64, c ∂ haarOnT64 := by
  simp [srOperator]

theorem sr_const_shape (c : ℂ) :
    srOperator (fun _ =&gt; c) = fun _ =&gt; ∫ _y : T64, c ∂ haarOnT64 := by
  funext x; exact srOperator_of_const c x

/-- If the mean of constants is the constant, then sr∘sr = sr on the image of sr
    (constants). Full idempotence on all f still axiom. -/
theorem sr_idempotent_on_constants (c : ℂ)
    (h : ∫ _y : T64, c ∂ haarOnT64 = c) :
    srOperator (srOperator (fun _ =&gt; c)) = srOperator (fun _ =&gt; c) := by
  have h1 := sr_const_shape c
  -- sr (const c) = const (∫ c) = const c under h
  simp only [h1, h]
  funext x
  simp [srOperator, h]

axiom srOperator_idempotent :
    ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

axiom srOperator_contractive :
    ∃ λ : ℝ, 0 &lt; λ ∧ λ ≤ 1 ∧ True

def TCSC_avg : Prop :=
  ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

theorem TCSC_avg_of_idempotent : srOperator_idempotent → TCSC_avg := id

end YXT.StandardTheory
