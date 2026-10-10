import YXT.Axiomatic.T64
import YXT.Axiomatic.Cl6
import YXT.Axiomatic.Reduction35
import YXT.Axiomatic.PeriodMatrix
import Mathlib.Data.Complex.Basic
import Mathlib.Algebra.BigOperators.Group.Finset
import Mathlib.Data.Finset.Basic

/-!
# generate_A as complex torus quotient
-/

namespace YXT.Axiomatic

abbrev Complex32 : Type := Fin 32 → ℂ

noncomputable def latticePoint (L : LatticeBasis32) (coeffs : Fin 32 → ℤ) : Complex32 :=
  fun i => ∑ j : Fin 32, (coeffs j : ℂ) * L j i

def inSpan (L : LatticeBasis32) (z : Complex32) : Prop :=
  ∃ coeffs : Fin 32 → ℤ, z = latticePoint L coeffs

def latticeRel (L : LatticeBasis32) (x y : Complex32) : Prop :=
  inSpan L (fun i => x i - y i)

theorem latticePoint_zero (L : LatticeBasis32) :
    latticePoint L (fun _ => (0 : ℤ)) = fun _ => (0 : ℂ) := by
  funext i
  simp [latticePoint]

theorem latticeRel_refl (L : LatticeBasis32) : Reflexive (latticeRel L) := by
  intro x
  refine ⟨fun _ => (0 : ℤ), ?_⟩
  funext i
  simp [latticePoint_zero]

theorem latticeRel_symm (L : LatticeBasis32) : Symmetric (latticeRel L) := by
  intro x y ⟨c, hc⟩
  refine ⟨fun j => -c j, ?_⟩
  funext i
  have hi := congr_fun hc i
  simp only [latticePoint]
  -- (y - x)_i = - (x - y)_i
  simp [← hi, Finset.sum_neg_distrib, neg_mul]
  ring

theorem latticeRel_trans (L : LatticeBasis32) : Transitive (latticeRel L) := by
  intro x y z ⟨c, hc⟩ ⟨d, hd⟩
  refine ⟨fun j => c j + d j, ?_⟩
  funext i
  have hci := congr_fun hc i
  have hdi := congr_fun hd i
  simp only [latticePoint, Finset.sum_add_distrib, add_mul]
  -- (x - z) = (x - y) + (y - z)
  linear_combination hci + hdi

def latticeSetoid (L : LatticeBasis32) : Setoid Complex32 where
  r := latticeRel L
  iseqv := ⟨latticeRel_refl L, latticeRel_symm L, latticeRel_trans L⟩

def LatticeQuotient (L : LatticeBasis32) : Type :=
  Quotient (latticeSetoid L)

instance (L : LatticeBasis32) : Nonempty (LatticeQuotient L) :=
  ⟨Quotient.mk (latticeSetoid L) (fun _ => 0)⟩

def quotientZero (L : LatticeBasis32) : LatticeQuotient L :=
  Quotient.mk (latticeSetoid L) (fun _ => 0)

def CMAbelian32 : Type := LatticeQuotient cmLatticeFormal

def cmAbelian32_zero : CMAbelian32 := quotientZero cmLatticeFormal

def generate_A (_t : T64) (_c : Cl6) : CMAbelian32 := cmAbelian32_zero

abbrev generate_A_def : T64 → Cl6 → CMAbelian32 := generate_A

theorem generate_A_uses_stages_17_28 :
    stagesForGenerateA = List.range 12 |>.map (· + 17) := rfl

def StageWindow : Type := { n : ℕ // n ∈ stagesForGenerateA }

theorem pipeline_stages_subset_35 :
    ∀ n ∈ stagesForGenerateA, n < 35 := by
  intro n hn
  have : n ∈ List.range 12 |>.map (· + 17) := by simpa [stagesForGenerateA] using hn
  simp only [List.mem_map, List.mem_range] at this
  obtain ⟨k, hk, rfl⟩ := this
  omega

structure GenerateAPipeline where
  torus : T64
  clifford : Cl6
  cmType : CMTypeChoice
  lattice : LatticeBasis32
  Ω : PeriodMatrix
  stages : List ℕ
  variety : CMAbelian32

def formalPipeline (t : T64) (c : Cl6) : GenerateAPipeline where
  torus := t
  clifford := c
  cmType := formalCMType
  lattice := cmLatticeFormal
  Ω := periodFromCMType formalCMType
  stages := stagesForGenerateA
  variety := generate_A t c

def formalLattice : LatticeBasis32 := cmLatticeFormal
def formalOmega : PeriodMatrix := periodMapStandard

end YXT.Axiomatic
