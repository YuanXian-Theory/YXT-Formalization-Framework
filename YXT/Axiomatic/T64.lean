import Mathlib.Topology.Instances.AddCircle
import Mathlib.Topology.Compactness.Compact

namespace YXT.Axiomatic

def T64 : Type := Fin 64 → AddCircle (1 : ℝ)

instance : TopologicalSpace T64 := Pi.topologicalSpace

instance : CompactSpace T64 := Pi.compactSpace

instance : Inhabited T64 := ⟨fun _ => 0⟩

theorem T64_card_index : Fintype.card (Fin 64) = 64 := by simp

end YXT.Axiomatic
