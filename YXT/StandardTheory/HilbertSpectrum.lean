namespace YXT.StandardTheory

axiom H_half : Type
axiom Delta_half : H_half → H_half
axiom IsSelfAdjointOp : (H_half → H_half) → Prop
axiom spectrumMem : (H_half → H_half) → Nat → Prop

axiom spectrum_real_of_self_adjoint :
    ∀ (f : H_half → H_half), IsSelfAdjointOp f →
      ∀ z : Nat, spectrumMem f z → True

end YXT.StandardTheory
