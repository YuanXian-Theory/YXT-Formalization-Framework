namespace YXT.Axiomatic

def Cl6 : Type := Fin 64

instance : Inhabited Cl6 := ⟨⟨0, by decide⟩⟩

theorem dim_combinatorial : (2 : Nat) ^ 6 = 64 := by decide

-- Binomial sum  C(6,0)+...+C(6,6) = 64, written out without Nat.choose
theorem binom_sum_six :
    (1 + 6 + 15 + 20 + 15 + 6 + 1 : Nat) = 64 := by decide

theorem cl6_matches_minimal_encoding : (2 : Nat) ^ 6 = 64 := dim_combinatorial

end YXT.Axiomatic
