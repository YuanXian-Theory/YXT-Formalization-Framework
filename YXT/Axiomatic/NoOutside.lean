/-!
# NoOutside — step 22: semantic package
-/

namespace YXT.Axiomatic

axiom NoOutside : Prop

axiom CosmosCarrier : Type

/-- Semantic package: closed whole recorded as a structure. -/
structure NoOutsideSemantics where
  closed_whole : NoOutside
  carrier : Type := CosmosCarrier

axiom noOutside_pack : NoOutside → NoOutsideSemantics

/-- Witness type for “law layer present”. -/
def NoOutsideLayer : Type := NoOutsideSemantics

end YXT.Axiomatic
