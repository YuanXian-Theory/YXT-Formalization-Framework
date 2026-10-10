import Mathlib.Topology.Instances.AddCircle
import Mathlib.Topology.Compactness.Compact

namespace YXT.Axiomatic

/-- Cosmic torus: 64-fold product of unit circles ℝ/ℤ. -/
def T64 : Type := Fin 64 → AddCircle (1 : ℝ)

instance : TopologicalSpace T64 := Pi.topologicalSpace

instance : CompactSpace T64 := Pi.compactSpace

instance : Inhabited T64 := ⟨fun _ => 0⟩

theorem two_pow_six : (2 : Nat) ^ 6 = 64 := by decide

theorem T64_index_eq : Fintype.card (Fin 64) = 64 := by decide

end YXT.Axiomatic
