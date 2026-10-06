/-!
# Period matrix, polarized lattice, CM embeddings
-/

import Mathlib.Data.Complex.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.Tactic.NormNum

namespace YXT.Axiomatic

abbrev PeriodMatrix : Type := Matrix (Fin 32) (Fin 32) ℂ
abbrev LatticeBasis32 : Type := Fin 32 → (Fin 32 → ℂ)
abbrev EmbeddingIndex : Type := Fin 64
abbrev CMTypeChoice : Type := Fin 32 → EmbeddingIndex

def formalCMType : CMTypeChoice :=
  fun i =&gt; ⟨(i : ℕ), by omega⟩

theorem formalCMType_range (i : Fin 32) : (formalCMType i : ℕ) &lt; 32 := i.is_lt

noncomputable def standardLattice : LatticeBasis32 :=
  fun j i =&gt; if i = j then (1 : ℂ) else 0

noncomputable def cmLatticeFromType (τ : CMTypeChoice) : LatticeBasis32 :=
  fun j i =&gt;
    let e := (τ j : ℕ) % 32
    if (i : ℕ) = e then (1 : ℂ) else 0

noncomputable def cmLatticeFormal : LatticeBasis32 := cmLatticeFromType formalCMType

def latticeRealRank : ℕ := 64
theorem latticeRealRank_eq : latticeRealRank = 64 := rfl

noncomputable def symplecticJ : Matrix (Fin 32) (Fin 32) ℂ :=
  Matrix.of fun i j =&gt;
    let i' := (i : ℕ)
    let j' := (j : ℕ)
    if i' &lt; 16 ∧ j' = i' + 16 then (1 : ℂ)
    else if j' &lt; 16 ∧ i' = j' + 16 then (-1 : ℂ)
    else 0

def RiemannBilinearZero (Ω : PeriodMatrix) : Prop :=
  Ω.transpose * symplecticJ * Ω = 0

axiom RiemannBilinearPos : PeriodMatrix → Prop

def RiemannPackage (Ω : PeriodMatrix) : Prop :=
  RiemannBilinearZero Ω ∧ RiemannBilinearPos Ω

structure IsPrincipallyPolarized (L : LatticeBasis32) : Prop where
  has_riemann : ∃ Ω : PeriodMatrix, RiemannPackage Ω

structure PolarizedLattice where
  lattice : LatticeBasis32
  polarized : IsPrincipallyPolarized lattice

noncomputable def omegaCandidate : PeriodMatrix :=
  Matrix.of fun i j =&gt; if i = j then (1 : ℂ) else 0

noncomputable def periodMapStandard : PeriodMatrix := omegaCandidate

theorem omegaCandidate_diagonal_one (i : Fin 32) :
    omegaCandidate i i = 1 := by
  simp [omegaCandidate, Matrix.of_apply]

noncomputable def periodMap (_L : LatticeBasis32) : PeriodMatrix := periodMapStandard

theorem periodMap_standard :
    periodMap standardLattice = periodMapStandard := rfl

axiom formal_polarized : IsPrincipallyPolarized cmLatticeFormal

noncomputable def formalPolarizedLattice : PolarizedLattice where
  lattice := cmLatticeFormal
  polarized := formal_polarized

axiom CMType32 : Type
axiom period_compatible_CM : PeriodMatrix → CMType32 → Prop

axiom exists_period_matrix_Riemann :
    ∃ Ω : PeriodMatrix, RiemannPackage Ω

noncomputable def periodFromCMType (τ : CMTypeChoice) : PeriodMatrix :=
  periodMap (cmLatticeFromType τ)

end YXT.Axiomatic
