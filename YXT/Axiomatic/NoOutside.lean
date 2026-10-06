/-!
# First principle: the cosmos has no outside

**Epistemic status**: Axiom (human entrance; replaceable formulation).  
**Source paper**: Axiomatic Reconstruction §2  
**Note**: Semantic strengthening beyond trivial non-existence of Type is Phase 2 work.
-/

namespace YXT.Axiomatic

/-- First principle: the cosmos is the unique closed whole with no external space, energy, or reference. -/
axiom NoOutside : Prop

/-- Placeholder semantics (to be strengthened: unique closed universe type + no external injection). -/
axiom NoOutside_semantics : NoOutside → True

end YXT.Axiomatic
