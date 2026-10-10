import YXT.Axiomatic.T64

namespace YXT.MindField

open YXT.Axiomatic

def IsFixedPoint (α : Type*) (F : α → α) (x : α) : Prop := F x = x

abbrev PsiSRCarrier : Type := T64 → Nat

def FixedPointEq (F : PsiSRCarrier → PsiSRCarrier) (ψ : PsiSRCarrier) : Prop :=
  F ψ = ψ

-- If pointwise negation equals the function, every value must be false.
theorem involution_fixed_point_unique_bool
    (ψ : Fin 64 → Bool)
    (h : (fun i => !ψ i) = ψ) :
    ψ = fun _ => false := by
  funext i
  have hi : !ψ i = ψ i := congrArg (fun f => f i) h
  cases hψ : ψ i with
  | false => rfl
  | true =>
    simp [hψ] at hi

end YXT.MindField
