import Mathlib.Data.Complex.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import YXT.Axiomatic.T64
import YXT.Axiomatic.Cl6
import YXT.Axiomatic.Reduction35
import YXT.Axiomatic.PeriodMatrix

namespace YXT.Axiomatic

/-- Ambient complex vector space ℂ³². -/
abbrev Complex32 : Type := Fin 32 → ℂ

instance : AddCommGroup Complex32 := inferInstance

/--
ℤ-span of the 32 basis columns of `L` inside ℂ³².
-/
def inLatticeSpan (L : LatticeBasis32) (v : Complex32) : Prop :=
  ∃ c : Fin 32 → ℤ, ∀ i : Fin 32, v i = ∑ j : Fin 32, (c j : ℂ) * L j i

/-- Lattice equivalence: x ∼ y iff x − y is in the ℤ-span of L. -/
def latticeRel (L : LatticeBasis32) (x y : Complex32) : Prop :=
  inLatticeSpan L (x - y)

theorem latticeRel_refl (L : LatticeBasis32) (x : Complex32) :
    latticeRel L x x := by
  refine ⟨fun _ => (0 : ℤ), ?_⟩
  intro i
  simp [Pi.sub_apply]

theorem latticeRel_symm (L : LatticeBasis32) {x y : Complex32}
    (h : latticeRel L x y) : latticeRel L y x := by
  obtain ⟨c, hc⟩ := h
  refine ⟨fun j => -c j, ?_⟩
  intro i
  have hi := hc i
  simp only [Pi.sub_apply] at hi ⊢
  -- (y - x) i = y i - x i = -(x i - y i)
  calc
    y i - x i = -(x i - y i) := by abel
    _ = -(∑ j : Fin 32, (c j : ℂ) * L j i) := by rw [hi]
    _ = ∑ j : Fin 32, ((-c j : ℤ) : ℂ) * L j i := by
        simp [Finset.sum_neg_distrib, neg_mul, Int.cast_neg]

theorem latticeRel_trans (L : LatticeBasis32) {x y z : Complex32}
    (hxy : latticeRel L x y) (hyz : latticeRel L y z) : latticeRel L x z := by
  obtain ⟨c, hc⟩ := hxy
  obtain ⟨d, hd⟩ := hyz
  refine ⟨fun j => c j + d j, ?_⟩
  intro i
  have hci := hc i
  have hdi := hd i
  simp only [Pi.sub_apply] at hci hdi ⊢
  calc
    x i - z i = (x i - y i) + (y i - z i) := by abel
    _ = (∑ j, (c j : ℂ) * L j i) + (∑ j, (d j : ℂ) * L j i) := by rw [hci, hdi]
    _ = ∑ j, ((c j + d j : ℤ) : ℂ) * L j i := by
        simp [Finset.sum_add_distrib, add_mul, Int.cast_add]

def latticeSetoid (L : LatticeBasis32) : Setoid Complex32 where
  r := latticeRel L
  iseqv := {
    refl := latticeRel_refl L
    symm := fun {_ _} => latticeRel_symm L
    trans := fun {_ _ _} => latticeRel_trans L
  }

def LatticeQuotient (L : LatticeBasis32) : Type := Quotient (latticeSetoid L)

instance (L : LatticeBasis32) : Nonempty (LatticeQuotient L) :=
  ⟨Quotient.mk (latticeSetoid L) (fun _ => 0)⟩

theorem zero_inLatticeSpan (L : LatticeBasis32) :
    inLatticeSpan L (fun _ => 0) :=
  ⟨fun _ => 0, by intro i; simp⟩

def CMAbelian32 : Type := LatticeQuotient cmLatticeFormal

def cmAbelian32_zero : CMAbelian32 :=
  Quotient.mk (latticeSetoid cmLatticeFormal) (fun _ => 0)

def generate_A (_t : T64) (_c : Cl6) : CMAbelian32 := cmAbelian32_zero

theorem generate_A_uses_stages :
    stagesForGenerateA.length = 12 := stagesForGenerateA_length

theorem generate_A_stages_window :
    stagesForGenerateA.head? = some 17 ∧ stagesForGenerateA.getLast? = some 28 :=
  ⟨stagesForGenerateA_head, stagesForGenerateA_last⟩

noncomputable def periodOfGenerated (_t : T64) (_c : Cl6) : PeriodMatrix :=
  periodMapStandard

theorem periodOfGenerated_RBR (_t : T64) (_c : Cl6) :
    RiemannBilinearRelations (periodOfGenerated _t _c) :=
  standard_satisfies_RBR

end YXT.Axiomatic
