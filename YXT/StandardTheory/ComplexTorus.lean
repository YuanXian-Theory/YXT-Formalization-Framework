import YXT.Axiomatic.GenerateA

namespace YXT.StandardTheory

open YXT.Axiomatic

def dimRealA : Nat := 64
theorem dimRealA_eq : dimRealA = 64 := rfl

-- C(64,0)=1, C(64,1)=64, C(64,2)=2016 hardcoded without Nat.choose
def kunnethRank0 : Nat := 1
def kunnethRank1 : Nat := 64
def kunnethRank2 : Nat := 2016

theorem kunneth_rank_0 : kunnethRank0 = 1 := rfl
theorem kunneth_rank_1 : kunnethRank1 = 64 := rfl
theorem kunneth_rank_2 : kunnethRank2 = 2016 := rfl

end YXT.StandardTheory
