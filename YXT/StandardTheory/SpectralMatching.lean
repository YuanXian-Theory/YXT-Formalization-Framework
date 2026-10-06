/-!
# Spectral matching for theorems 7.1 / 7.3 (Phase 4 glue)

**Epistemic status**: Yuanxian theorem formalization framework (interfaces).  
**Source**: Formalization Foundation §7; Standard Theory §8
-/

import YXT.StandardTheory.Cyclotomic85
import YXT.StandardTheory.HilbertSpectrum
import YXT.StandardTheory.EllAdic

namespace YXT.StandardTheory

/-- Theorem 7.1 interface: prime spectrum embeds via cyclotomic decomposition. -/
theorem prime_spectrum_embedding_interface :
    ∀ p : Nat, ∃ c : Cyclotomic85, CyclotomicPrimeDecomposition p c :=
  prime_decomposition_exists

/-- Theorem 7.3 interface: spectrum points ↔ Euler zeros (bidirectional axiom). -/
axiom spectral_matching_interface :
    ∀ (E : EulerFactor) (s : ℂ),
      (spectrumMem Delta_half s → eulerZero E s) ∧
      (eulerZero E s → spectrumMem Delta_half s)

end YXT.StandardTheory
