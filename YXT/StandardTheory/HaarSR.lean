import YXT.Axiomatic.T64

namespace YXT.StandardTheory

open YXT.Axiomatic

-- Simplified interface without MeasureTheory instances for CI stability
axiom haarOnT64 : Type

axiom srOperator : (T64 → ℂ) → (T64 → ℂ)

axiom srOperator_idempotent :
    ∀ f : T64 → ℂ, srOperator (srOperator f) = srOperator f

end YXT.StandardTheory
