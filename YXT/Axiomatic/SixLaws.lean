/-!
# Six ultimate iron laws

**Epistemic status**: Axioms (structural necessities under the no-outside principle; formulations replaceable).  
**Source paper**: Axiomatic Reconstruction §3; Ontological master outline
-/

namespace YXT.Axiomatic

axiom FactorConservation : Prop
axiom SpacetimeUniqueness : Prop
axiom CircularSelfConsistency : Prop
axiom SelfReferentialField : Prop
axiom ZeroSumEnergy : Prop
axiom MinimalEncoding : Prop

/-- Six cognitive strata index. -/
def CognitiveDimension : Type := Fin 6

/-- Minimal encoding unit 2⁶ = 64. -/
theorem minimal_encoding_card : (2 : ℕ) ^ 6 = 64 := by norm_num

theorem cognitive_dimension_card : Fintype.card CognitiveDimension = 6 := by
  simp [CognitiveDimension, Fintype.card_fin]

end YXT.Axiomatic
