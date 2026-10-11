# Progress

## CI
- Pure-stdlib skeleton: green
- Mathlib v4.26.0: green (T64 UnitAddCircle, Cl6 CliffordAlgebra, Cyclotomic85)

## Wave 1–3 (this push)

| Item | Status | Notes |
|------|--------|-------|
| 1 Haar | interface + Mathlib haar on UnitAddCircle; `haarT64` via `Measure.pi` | IsProbabilityMeasure on factor; product may need instance polish in CI |
| 2 Cl6 ω² | `omega` defined as ∏ ι(eᵢ); `omega_sq` axiom (±1) | Expand to proof later |
| 3 CM / period | Complex32, PeriodMatrix over ℂ, RBR axiom, generate_A + periodOfGenerated | Lattice span still True-relation placeholder |

## Next candidates
- Prove product Haar is probability (or pin Mathlib lemma)
- Expand omega_sq without axiom
- Replace latticeRel by Submodule.span ℤ
- Wire Haar average into srOperator
