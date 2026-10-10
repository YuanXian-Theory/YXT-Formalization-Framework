namespace YXT.Axiomatic

axiom NoOutside : Prop

axiom CosmosCarrier : Type

structure NoOutsideSemantics where
  closed_whole : NoOutside

axiom noOutside_pack : NoOutside → NoOutsideSemantics

end YXT.Axiomatic
