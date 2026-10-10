import YXT.Axiomatic.T64
import YXT.Axiomatic.Cl6
import YXT.Axiomatic.GenerateA
import YXT.Axiomatic.NoOutside
import YXT.Axiomatic.SixLaws

/-!
# Four-layer rigid hierarchy L0–L3
-/

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

structure Layer2 where
  l1 : Layer1
  usesStages : stagesForGenerateA.length = 12

structure Layer3 where
  l2 : Layer2
  closed : True

structure FourLayerRigidHierarchy where
  l0 : Layer0
  l1 : Layer1
  l2 : Layer2
  l3 : Layer3
  chain_l1 : l1.l0 = l0
  chain_l2 : l2.l1 = l1
  chain_l3 : l3.l2 = l2

def backtrack (H : FourLayerRigidHierarchy) : Layer0 := H.l0

theorem backtrack_eq (H : FourLayerRigidHierarchy) : backtrack H = H.l0 := rfl

end YXT.Ontology
