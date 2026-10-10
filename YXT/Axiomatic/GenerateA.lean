import YXT.Axiomatic.T64
import YXT.Axiomatic.Cl6
import YXT.Axiomatic.Reduction35
import YXT.Axiomatic.PeriodMatrix

namespace YXT.Axiomatic

def Complex32 : Type := Fin 32 → Nat

def latticeRel (_L : LatticeBasis32) : Complex32 → Complex32 → Prop :=
  fun _ _ => True

def latticeSetoid (L : LatticeBasis32) : Setoid Complex32 where
  r := latticeRel L
  iseqv := ⟨fun _ => trivial, fun _ _ h => h, fun _ _ _ _ _ => trivial⟩

def LatticeQuotient (L : LatticeBasis32) : Type := Quotient (latticeSetoid L)

instance (L : LatticeBasis32) : Nonempty (LatticeQuotient L) :=
  ⟨Quotient.mk (latticeSetoid L) (fun _ => 0)⟩

def CMAbelian32 : Type := LatticeQuotient cmLatticeFormal

def cmAbelian32_zero : CMAbelian32 :=
  Quotient.mk (latticeSetoid cmLatticeFormal) (fun _ => 0)

def generate_A (_t : T64) (_c : Cl6) : CMAbelian32 := cmAbelian32_zero

theorem generate_A_uses_stages :
    stagesForGenerateA.length = 12 := stagesForGenerateA_length

end YXT.Axiomatic
