# Axiom inventory

## Eliminated / upgraded

| Item | Status |
|------|--------|
| Cyclotomic85 | `CyclotomicField 85 ℚ` |
| Cl6 | `CliffordAlgebra Q6` |
| haarOnT64 / srOperator | product Haar + integral mean |
| CMAbelian32 | `abbrev` := `LatticeQuotient cmLatticeFormal` |
| generate_A | `generate_A_def` via `Classical.choice` on nonempty quotient |
| IsPrincipallyPolarized | structure with `has_riemann` field |
| PolarizedLattice | structure |
| formalPipeline | definitional package |

## Still axiom

| Axiom | Why |
|-------|-----|
| `LatticeQuotient` | Full `ℂ³² / AddSubgroup` needs Mathlib subgroup of lattice points |
| `LatticeQuotient_nonempty` | Until quotient is constructed |
| `formal_polarized` | Placeholder polarization witness |
| `RiemannBilinearPos` | Hermitian positivity |
| `omega` (Cl6) | Pseudoscalar product |
| Hilbert / Tate / CM Shimura / Torus Hk | Standard-theory depth |
| srOperator idempotent/contractive proofs | Measure instances |

## Honest note on steps 4–5

Type-level generation path is closed: `(T64, Cl6) → CMAbelian32` is a `def`.
Arithmetic content (true CM lattice from embeddings of ℚ(ζ₈₅), proven Riemann package)
remains open and is the main research residual.
