import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Tactic.NormNum
import YXT.Axiomatic.GenerateA

namespace YXT.StandardTheory

open YXT.Axiomatic

def dimRealA : ℕ := 64
theorem dimRealA_eq : dimRealA = 64 := rfl

def kunnethRank (k : ℕ) : ℕ := Nat.choose 64 k

theorem kunneth_rank_0 : kunnethRank 0 = 1 := by native_decide
theorem kunneth_rank_1 : kunnethRank 1 = 64 := by native_decide
theorem kunneth_rank_2 : kunnethRank 2 = 2016 := by native_decide

end YXT.StandardTheory
