import YXT.Axiomatic.T64
import YXT.Axiomatic.Cl6
import YXT.Axiomatic.GenerateA
import YXT.Axiomatic.NoOutside

namespace YXT.Ontology

open YXT.Axiomatic

structure Layer0 where
  noOutside : NoOutside
  torus : T64
  clifford : Cl6

structure Layer1 where
  l0 : Layer0
  variety : CMAbelian32
  generated : variety = generate_A l0.torus l0.clifford

structure FourLayerRigidHierarchy where
  l0 : Layer0
  l1 : Layer1
  chain : l1.l0 = l0

def backtrack (H : FourLayerRigidHierarchy) : Layer0 := H.l0

end YXT.Ontology
