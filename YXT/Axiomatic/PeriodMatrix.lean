namespace YXT.Axiomatic

def PeriodMatrix : Type := Fin 32 → Fin 32 → Nat

def LatticeBasis32 : Type := Fin 32 → Fin 32 → Nat

def EmbeddingIndex : Type := Fin 64

def CMTypeChoice : Type := Fin 32 → EmbeddingIndex

def formalCMType : CMTypeChoice :=
  fun i =>
    ⟨i.val, Nat.lt_trans i.isLt (by decide : (32 : Nat) < 64)⟩

def standardLattice : LatticeBasis32 := fun j i => if i = j then 1 else 0

def cmLatticeFormal : LatticeBasis32 := standardLattice

def latticeRealRank : Nat := 64

def periodMapStandard : PeriodMatrix := fun _ _ => 0

def periodFromCMType (_τ : CMTypeChoice) : PeriodMatrix := periodMapStandard

axiom CMType32 : Type

end YXT.Axiomatic
