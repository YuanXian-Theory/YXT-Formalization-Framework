import YXT.Axiomatic.GenerateA

/-!
# ℓ-adic interfaces
-/

namespace YXT.StandardTheory

open YXT.Axiomatic

axiom TateModule : CMAbelian32 → Nat → Type
axiom FrobeniusAction : ∀ (A : CMAbelian32) (ℓ : Nat), TateModule A ℓ → TateModule A ℓ
axiom EulerFactor : Type
axiom eulerZero : EulerFactor → ℂ → Prop
axiom frobenius_euler_factor : ∀ (A : CMAbelian32) (ℓ : Nat), EulerFactor

def tateAmbientDim : ℕ := 64
theorem tateAmbientDim_eq : tateAmbientDim = 64 := rfl

def tateRankTarget : ℕ := 64
theorem tateRankTarget_eq : tateRankTarget = 2 * 32 := by norm_num

end YXT.StandardTheory
