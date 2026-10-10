namespace YXT.Axiomatic

def T64 : Type := Fin 64 → Bool

instance : Inhabited T64 := ⟨fun _ => false⟩

theorem two_pow_six : (2 : Nat) ^ 6 = 64 := by decide

theorem fin64_eq : (64 : Nat) = 64 := rfl

end YXT.Axiomatic
