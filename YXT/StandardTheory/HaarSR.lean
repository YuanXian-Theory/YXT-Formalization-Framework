import YXT.Axiomatic.T64

namespace YXT.StandardTheory

open YXT.Axiomatic

axiom srOperator : (T64 → Nat) → (T64 → Nat)

axiom srOperator_idempotent :
    ∀ f : T64 → Nat, srOperator (srOperator f) = srOperator f

end YXT.StandardTheory
