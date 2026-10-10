import YXT.Axiomatic.GenerateA
import YXT.StandardTheory.Cyclotomic85

namespace YXT.StandardTheory

open YXT.Axiomatic

axiom CMTypeOf : CMAbelian32 → Type
axiom PrincipalPolarization : CMAbelian32 → Type

theorem cm_type_matches_cardinality : cmTypeCardinality = 32 := rfl

end YXT.StandardTheory
