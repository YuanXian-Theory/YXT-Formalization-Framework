/-!
# Four-layer rigid ontological hierarchy L0–L3

**Epistemic status**: Interface / phenomenological hierarchy (Formalization Foundation).  
**Source paper**: Formalization Foundation §4
-/

namespace YXT.Ontology

/-- Layer index: L0 base ontology, L1 derived entities, L2 space operators, L3 global structure. -/
inductive Layer : Type where
  | L0 | L1 | L2 | L3
  deriving DecidableEq, Repr

/-- Placeholder rigid hierarchy carrier. -/
axiom FourLayerRigidHierarchy : Type

/-- Derivation relation between layers (backtracking constraint). -/
axiom DerivesFrom : Layer → Layer → Prop

end YXT.Ontology
