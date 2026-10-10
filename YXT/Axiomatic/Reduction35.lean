namespace YXT.Axiomatic

inductive ReductionStep : Type where
  | step : Fin 35 → ReductionStep
  deriving Repr, DecidableEq

def stagesForGenerateA : List Nat :=
  [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28]

theorem stagesForGenerateA_length : stagesForGenerateA.length = 12 := by decide

theorem stagesForGenerateA_head : stagesForGenerateA.head? = some 17 := by decide

theorem stagesForGenerateA_last : stagesForGenerateA.getLast? = some 28 := by decide

theorem stages_lt_35 : ∀ n ∈ stagesForGenerateA, n < 35 := by
  intro n hn
  decide

end YXT.Axiomatic
