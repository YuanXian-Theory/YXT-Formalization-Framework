import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Algebra.Star.Basic

/-!
# Hilbert self-adjoint spectrum interface
-/

namespace YXT.StandardTheory

axiom H_half : Type
axiom Delta_half : H_half → H_half
axiom IsSelfAdjointOp : (H_half → H_half) → Prop
axiom spectrumMem : (H_half → H_half) → ℂ → Prop

axiom spectrum_real_of_self_adjoint :
    ∀ (f : H_half → H_half), IsSelfAdjointOp f →
      ∀ z : ℂ, spectrumMem f z → z.im = 0

abbrev SelfAdjointSpectrumReal := spectrum_real_of_self_adjoint

end YXT.StandardTheory
