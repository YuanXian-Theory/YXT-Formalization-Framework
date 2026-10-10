import YXT.StandardTheory.Cyclotomic85
import YXT.StandardTheory.HilbertSpectrum
import YXT.StandardTheory.EllAdic

namespace YXT.StandardTheory

theorem prime_spectrum_embedding_interface :
    ∀ p : Nat, ∃ c : Cyclotomic85, CyclotomicPrimeDecomposition p c :=
  prime_decomposition_exists

axiom spectral_matching_interface :
    ∀ (E : EulerFactor) (s : ℂ),
      (spectrumMem Delta_half s → eulerZero E s) ∧
      (eulerZero E s → spectrumMem Delta_half s)

end YXT.StandardTheory
