/-!
# First principle: the cosmos has no outside

**Epistemic status**: Axiom (human entrance; replaceable formulation).  
**Phase 2**: Stronger semantic skeleton — unique closed carrier type + no external injection.
-/

namespace YXT.Axiomatic

/-- First principle as a proposition. -/
axiom NoOutside : Prop

/-- Abstract carrier of the unique closed cosmos (not a Type-universe external). -/
axiom CosmosCarrier : Type

/-- No external reference type injects into the cosmos carrier (skeleton).
    Full statement uses univalence/universe constraints; here we record the intent. -/
axiom no_external_injection :
    ∀ (E : Type) (f : E → CosmosCarrier), True

/-- Semantic package: closed whole + no external energy/reference channels. -/
structure NoOutsideSemantics where
  closed_whole : NoOutside
  carrier : CosmosCarrier
  no_external : True

axiom noOutside_pack : NoOutside → NoOutsideSemantics

end YXT.Axiomatic
