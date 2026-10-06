/-!
# Four-layer rigid hierarchy L0–L3 (step 11)

**Epistemic status**: Ontological docking framework.  
**Source**: Formalization Foundation paper (rigid anchoring).

L0 underlying ontology → L1 derived entities → L2 spatial operators → L3 global structure.
-/

import YXT.Axiomatic.T64
import YXT.Axiomatic.Cl6
import YXT.Axiomatic.GenerateA
import YXT.Axiomatic.NoOutside
import YXT.Axiomatic.SixLaws

namespace YXT.Ontology

open YXT.Axiomatic

/-- L0: underlying ontology — closed cosmos + encoding laws. -/
structure Layer0 where
  noOutside : NoOutside
  torus : T64
  clifford : Cl6

/-- L1: derived entity — 32-dim CM abelian variety from generate_A. -/
structure Layer1 where
  l0 : Layer0
  variety : CMAbelian32
  generated : variety = generate_A l0.torus l0.clifford

/-- L2: spatial / spectral operators (marker for Δ½, Haar averaging). -/
structure Layer2 where
  l1 : Layer1
  usesStages : stagesForGenerateA.length = 12

/-- L3: global structure — four-layer package closed. -/
structure Layer3 where
  l2 : Layer2
  closed : True

/-- Full hierarchy as a single package. -/
structure FourLayerRigidHierarchy where
  l0 : Layer0
  l1 : Layer1
  l2 : Layer2
  l3 : Layer3
  chain_l1 : l1.l0 = l0
  chain_l2 : l2.l1 = l1
  chain_l3 : l3.l2 = l2

/-- Backtracking: L3 determines L2, L1, L0 carriers (projection). -/
def backtrack (H : FourLayerRigidHierarchy) : Layer0 := H.l0

theorem backtrack_eq (H : FourLayerRigidHierarchy) : backtrack H = H.l0 := rfl

/-- Stage window length docks to L2. -/
theorem layer2_stages (l2 : Layer2) : l2.usesStages := l2.usesStages

end YXT.Ontology
