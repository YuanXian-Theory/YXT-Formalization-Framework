/-!
# Hilbert-space self-adjoint spectrum (standard theory interface)

**Epistemic status**: Cited standard theory formalization framework.  
**Source paper**: Standard Theory §4  
**Target**: Mathlib `IsSelfAdjoint` ⇒ spectrum ⊆ ℝ.
-/

import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Algebra.Star.Basic

namespace YXT.StandardTheory

/-- Half-period critical subspace (carrier interface). -/
axiom H_half : Type

/-- Model operator Δ_{1/2}. -/
axiom Delta_half : H_half → H_half

/-- Self-adjointness predicate (to be aligned with Mathlib IsSelfAdjoint when H_half is an InnerProductSpace). -/
axiom IsSelfAdjointOp : (H_half → H_half) → Prop

/-- Spectrum membership. -/
axiom spectrumMem : (H_half → H_half) → ℂ → Prop

/-- **Spectral reality interface** (Hilbert self-adjoint spectrum theorem).
    Full proof docks to Mathlib once `H_half` carries an inner-product structure. -/
axiom spectrum_real_of_self_adjoint :
    ∀ (f : H_half → H_half), IsSelfAdjointOp f →
      ∀ z : ℂ, spectrumMem f z → z.im = 0

/-- Named export matching Formalization Foundation `SelfAdjointSpectrumReal`. -/
abbrev SelfAdjointSpectrumReal := spectrum_real_of_self_adjoint

end YXT.StandardTheory
