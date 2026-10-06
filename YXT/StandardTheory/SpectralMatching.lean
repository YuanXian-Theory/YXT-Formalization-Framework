/-!
# Spectral matching — step 23
-/

import YXT.StandardTheory.Cyclotomic85
import YXT.StandardTheory.HilbertSpectrum
import YXT.StandardTheory.EllAdic

namespace YXT.StandardTheory

/-- Theorem 7.1 interface (already a theorem from prime_decomposition_exists). -/
theorem prime_spectrum_embedding_interface :
    ∀ p : Nat, ∃ c : Cyclotomic85, CyclotomicPrimeDecomposition p c :=
  prime_decomposition_exists

/-- Theorem 7.3 shape: spectrum ↔ Euler zeros. -/
axiom spectral_matching_interface :
    ∀ (E : EulerFactor) (s : ℂ),
      (spectrumMem Delta_half s → eulerZero E s) ∧
      (eulerZero E s → spectrumMem Delta_half s)

/-- Named export for paper docking tables. -/
def Theorem71 := prime_spectrum_embedding_interface
def Theorem73_shape := spectral_matching_interface

end YXT.StandardTheory
