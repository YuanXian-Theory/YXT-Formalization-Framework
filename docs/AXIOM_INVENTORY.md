# Remaining axiom inventory

## Eliminated

| Item | Status |
|------|--------|
| Abstract `Cyclotomic85` + equiv | **Done** — `abbrev Cyclotomic85 := CyclotomicField 85 ℚ` |
| Abstract `Cl6` + equiv | **Done** — `abbrev Cl6 := CliffordAlgebra Q6` |
| `oneCl` | **Done** — `def oneCl := 1` |
| Old Galois axiom card chain | Replaced by `Units (ZMod 85)` target + totient theorems |

## Still present

### Axiomatic
| Axiom | Module | Next step |
|-------|--------|-----------|
| `omega`, `omega_sq_eq_neg_one` | Cl6 | Express as Clifford product of basis |
| `NoOutside` package | NoOutside | Philosophical layer (optional keep) |
| Six law Props | SixLaws | By design |
| `step_elimination_condition` | Reduction35 | Port machine proof |
| `RiemannBilinearPos`, polarization, `periodMap` | PeriodMatrix | AG construction |
| `CMAbelian32`, `generate_A`, pipeline axioms | GenerateA | Quotient by lattice |

### Standard theory
| Axiom | Module | Next step |
|-------|--------|-----------|
| `CyclotomicPrimeDecomposition` | Cyclotomic85 | Mathlib factorization |
| Hilbert spectrum carriers | HilbertSpectrum | InnerProductSpace |
| Haar / srOperator | HaarSR | Mathlib Haar |
| Tate / Frobenius / Euler | EllAdic | ℓ-adic stack |
| CM polarization / Shimura | CMAbelian | AG |
| ComplexTorus / Hk | ComplexTorus | Mathlib |
| spectral_matching | SpectralMatching | After spectrum+Euler |

### MindField
| `PsiSRCarrier`, `FixedPointEq` | Define on function space on T64 |

## Queue
3. Haar on T64  
4. Polarized CM lattice + Riemann  
5. generate_A as ℂ³²/Λ  
