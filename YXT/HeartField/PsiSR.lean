/-!
# Self-referential heart field Ψ_SR

**Epistemic status**: Ontological-layer technical formalization (to absorb zero-sorry proofs from existing repos).  
**Docking**: Yuanxian-Consciousness, ZFC-Extension  
**Source**: Series Overview inventory of heart-field theorems
-/

namespace YXT.HeartField

/-- Self-referential heart field carrier (interface). -/
axiom PsiSR : Type

/-- Fixed-point equation Ψ = F(Ψ). -/
axiom FixedPointEq : PsiSR → Prop

/-- Contractive self-map (to be imported from existing Lean proofs). -/
axiom SelfMapContracting : Prop

end YXT.HeartField
