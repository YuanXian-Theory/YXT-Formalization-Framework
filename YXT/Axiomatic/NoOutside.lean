/-!
# NoOutside — first principle package
-/

namespace YXT.Axiomatic

axiom NoOutside : Prop

axiom CosmosCarrier : Type

structure NoOutsideSemantics where
  closed_whole : NoOutside

axiom noOutside_pack : NoOutside → NoOutsideSemantics

def NoOutsideLayer : Type := NoOutsideSemantics

end YXT.Axiomatic
