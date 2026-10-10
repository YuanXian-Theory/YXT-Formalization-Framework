namespace YXT.Axiomatic

/-- Combinatorial stand-in for Cl6 dimension until Mathlib Clifford is wired. -/
def Cl6 : Type := Fin 64

instance : Inhabited Cl6 := ⟨⟨0, by decide⟩⟩

theorem dim_combinatorial : (2 : Nat) ^ 6 = 64 := by decide

theorem binom_sum_six :
    (Nat.choose 6 0 + Nat.choose 6 1 + Nat.choose 6 2 + Nat.choose 6 3 +
      Nat.choose 6 4 + Nat.choose 6 5 + Nat.choose 6 6) = 64 := by
  decide

theorem cl6_matches_minimal_encoding : (2 : Nat) ^ 6 = 64 := dim_combinatorial

end YXT.Axiomatic
