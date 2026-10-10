import Mathlib.Data.Nat.Choose.Basic
import YXT.Axiomatic.GenerateA

namespace YXT.StandardTheory

open YXT.Axiomatic

def dimRealA : Nat := 64
theorem dimRealA_eq : dimRealA = 64 := rfl

def kunnethRank (k : Nat) : Nat := Nat.choose 64 k

theorem kunneth_rank_0 : kunnethRank 0 = 1 := by decide
theorem kunneth_rank_1 : kunnethRank 1 = 64 := by decide
theorem kunneth_rank_2 : kunnethRank 2 = 2016 := by decide

end YXT.StandardTheory
