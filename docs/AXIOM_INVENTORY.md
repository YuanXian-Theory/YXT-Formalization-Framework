# Remaining axiom inventory

## Eliminated

| Item | Status |
|------|--------|
| Abstract Cyclotomic85 | **Done** — `CyclotomicField 85 ℚ` |
| Abstract Cl6 | **Done** — `CliffordAlgebra Q6` |
| `haarOnT64` axiom | **Done** — `Measure.pi` of `addHaar` on AddCircle |
| `srOperator` axiom | **Done** — integral mean `∫ y, f y ∂ haarOnT64` |

## Still present (selected)

| Axiom | Module | Notes |
|-------|--------|-------|
| `srOperator_idempotent` | HaarSR | Needs integrability; mathematically clear for constants |
| `srOperator_contractive` | HaarSR | Lipschitz ≤ 1 in sup norm |
| `omega` | Cl6 | Clifford basis product |
| `periodMap`, polarization, Riemann pos | PeriodMatrix | AG |
| `CMAbelian32`, `generate_A` | GenerateA | Quotient |
| Hilbert / Tate / CM / Torus stacks | StandardTheory | As before |
| `PsiSRCarrier` | MindField | Functions on T64 |

## Queue
4. Polarized CM lattice + Riemann  
5. generate_A as ℂ³²/Λ  
Optional: prove `srOperator_idempotent` with full MeasureTheory instances  
