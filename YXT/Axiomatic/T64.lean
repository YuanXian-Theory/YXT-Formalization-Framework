import Mathlib.Topology.Instances.AddCircle.Real

namespace YXT.Axiomatic

/-- Cosmic torus: product of 64 unit circles ℝ/ℤ (Mathlib UnitAddCircle). -/
abbrev T64 : Type := Fin 64 → UnitAddCircle

instance : CompactSpace T64 := Pi.compactSpace

instance : Inhabited T64 := inferInstance

theorem two_pow_six : (2 : Nat) ^ 6 = 64 := by decide

theorem T64_index_eq : Fintype.card (Fin 64) = 64 := by decide

end YXT.Axiomatic
