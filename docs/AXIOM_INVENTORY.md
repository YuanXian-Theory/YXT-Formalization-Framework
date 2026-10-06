# Remaining axiom inventory

Goal: shrink this list by replacing `axiom` with `def`/`theorem` or Mathlib citations.

## Axiomatic / construction

| Axiom | Module | Elimination strategy |
|-------|--------|----------------------|
| `Cl6`, `oneCl`, `omega`, `mulCl` | Cl6 | Use only `Cl6Mathlib`; drop abstract carrier |
| `Cl6_equiv_mathlib` | Cl6 | Becomes `Equiv.refl` once Cl6 := Cl6Mathlib |
| `NoOutside`, `CosmosCarrier`, … | NoOutside | Keep as philosophical axioms or encode as structure |
| Six law `Prop` axioms | SixLaws | Keep as axiom layer (by design) |
| `step_elimination_condition` | Reduction35 | Port from 35-step machine proof |
| `RiemannBilinearPos` | PeriodMatrix | Hermitian form on H¹ |
| `IsPrincipallyPolarized` | PeriodMatrix | Define via Riemann form |
| `periodMap` | PeriodMatrix | Integrate holomorphic 1-forms on lattice |
| `CMAbelian32`, `generate_A` | GenerateA | Quotient ℂ³²/Λ for explicit Λ |
| `generate_A_induces_period` | GenerateA | Follows from periodMap_riemann once polarized |
| Pipeline equality axioms | GenerateA | Definitional once generate_A is a def |

## Standard theory

| Axiom | Module | Strategy |
|-------|--------|----------|
| `Cyclotomic85` + equiv | Cyclotomic85 | `abbrev Cyclotomic85 := Cyclotomic85Mathlib` |
| `Cyclotomic85_Galois` + card | Cyclotomic85 | Mathlib `galCyclotomicEquivUnits` / card lemmas |
| `CyclotomicPrimeDecomposition` | Cyclotomic85 | Mathlib factorization in cyclotomic extensions |
| `H_half`, `Delta_half`, spectrum | HilbertSpectrum | InnerProductSpace + IsSelfAdjoint |
| `haarOnT64`, `srOperator` | HaarSR | Mathlib Haar on compact groups |
| `TateModule`, `FrobeniusAction` | EllAdic | Mathlib/ FLT libraries when available |
| `CMTypeOf`, `PrincipalPolarization`, `shimura_taniyama` | CMAbelian | Algebraic geometry stack |
| `ComplexTorus`, `Hk`, `kunneth_rank_module` | ComplexTorus | Mathlib torus cohomology |
| `spectral_matching_interface` | SpectralMatching | Follows from Euler ↔ spectrum once both defined |

## MindField

| Axiom | Strategy |
|-------|----------|
| `PsiSRCarrier`, `FixedPointEq` | Define on C(T64, ℂ) with srOperator |

## Elimination order (recommended)

1. `Cyclotomic85 := CyclotomicField 85 ℚ` (low risk)
2. `Cl6 := Cl6Mathlib` (low risk once QuadraticForm instances OK)
3. Haar on T64 (medium)
4. periodMap + polarized lattice (high — research level)
5. generate_A as quotient (depends on 4)
