/-!
# T⁶⁴ topological body

**Epistemic status**: Axiomatic construction framework (Mathlib-oriented).  
**Source paper**: Axiomatic Reconstruction §4  
**Principle**: Reuse Mathlib `AddCircle`; target elimination of CompactSpace / TopologicalGroup axioms.
-/

import Mathlib.Topology.Instances.AddCircle
import Mathlib.Topology.Algebra.InfiniteSum.Basic

namespace YXT.Axiomatic

/-- 64-dimensional compact torus as product of unit circles.
    Model: `ℝ⁶⁴ / ℤ⁶⁴ ≃ (ℝ/ℤ)⁶⁴`. -/
def T64 : Type := Fin 64 → AddCircle (1 : ℝ)

namespace T64

/-- Product topology is compact (Mathlib: finite product of compact spaces). -/
instance : CompactSpace T64 := by
  dsimp [T64]
  infer_instance

/-- Pointwise addition makes T64 a topological additive group. -/
instance : TopologicalAddGroup T64 := by
  dsimp [T64]
  infer_instance

/-- Real dimension of the covering space ℝ⁶⁴ is 64. -/
theorem cover_dim : Module.finrank ℝ (Fin 64 → ℝ) = 64 := by
  simp [Module.finrank_pi]

end T64

end YXT.Axiomatic
