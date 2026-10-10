import YXT.Axiomatic.GenerateA
import YXT.Axiomatic.PeriodMatrix
import YXT.StandardTheory.Cyclotomic85

/-!
# CM abelian variety interfaces
-/

namespace YXT.StandardTheory

open YXT.Axiomatic

axiom CMTypeOf : CMAbelian32 → Type
axiom PrincipalPolarization : CMAbelian32 → Type

axiom shimura_taniyama :
    ∀ (A : CMAbelian32) (_L : PrincipalPolarization A),
      ∃! _τ : CMTypeOf A, True

theorem cm_type_matches_cardinality : cmTypeCardinality = 32 := rfl

axiom CMType32_of_variety : CMAbelian32 → CMType32

end YXT.StandardTheory
