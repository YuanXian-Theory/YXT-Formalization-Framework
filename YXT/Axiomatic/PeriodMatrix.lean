import Mathlib.Data.Complex.Basic
import Mathlib.Data.Matrix.Basic

namespace YXT.Axiomatic

abbrev PeriodMatrix : Type := Matrix (Fin 32) (Fin 32) ℂ
abbrev LatticeBasis32 : Type := Fin 32 → (Fin 32 → ℂ)
abbrev EmbeddingIndex : Type := Fin 64
abbrev CMTypeChoice : Type := Fin 32 → EmbeddingIndex

def formalCMType : CMTypeChoice :=
  fun i => ⟨(i : ℕ), by omega⟩

noncomputable def standardLattice : LatticeBasis32 :=
  fun j i => if i = j then (1 : ℂ) else 0

noncomputable def cmLatticeFormal : LatticeBasis32 := standardLattice

def latticeRealRank : ℕ := 64

noncomputable def omegaBlock : PeriodMatrix :=
  Matrix.of fun i j => if i = j then (1 : ℂ) else 0

noncomputable def periodMapStandard : PeriodMatrix := omegaBlock

noncomputable def periodMap (_L : LatticeBasis32) : PeriodMatrix := periodMapStandard

noncomputable def periodFromCMType (_τ : CMTypeChoice) : PeriodMatrix := periodMapStandard

axiom CMType32 : Type

end YXT.Axiomatic
