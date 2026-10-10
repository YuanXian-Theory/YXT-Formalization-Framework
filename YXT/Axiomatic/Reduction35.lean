namespace YXT.Axiomatic

inductive ReductionStep : Type where
  | step : Fin 35 → ReductionStep
  deriving Repr, DecidableEq

def stagesForGenerateA : List Nat :=
  [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]

theorem stagesForGenerateA_length : stagesForGenerateA.length = 12 := by decide

theorem stagesForGenerateA_head : stagesForGenerateA.head? = some 17 := by decide

theorem stagesForGenerateA_last : stagesForGenerateA.getLast? = some 28 := by decide

theorem stage_17_lt_35 : 17 < 35 := by decide
theorem stage_28_lt_35 : 28 < 35 := by decide

end YXT.Axiomatic
