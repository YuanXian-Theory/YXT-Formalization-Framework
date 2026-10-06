# Axiom inventory

## Eliminated (1–7)

| Step | Item |
|------|------|
| 1 | Cyclotomic85 := CyclotomicField 85 ℚ |
| 2 | Cl6 := CliffordAlgebra Q6 |
| 3 | haarOnT64, srOperator defs |
| 4 | PolarizedLattice structure |
| 5 | CMAbelian32 type-level generation |
| **6** | **LatticeQuotient := Quotient (latticeSetoid L)** |
| **7** | **generate_A def, no sorry; StageWindow; stages nodup** |

## Still axiom / open

| Item | Notes |
|------|-------|
| `latticeRel` currently `True` | Must become “difference ∈ ℤ-span(L)” with real coordinates |
| `formal_polarized`, `RiemannBilinearPos` | Arithmetic CM |
| `omega` (Cl6) | Basis product |
| Hilbert / Tate / Shimura / Hk | Standard theory depth |
| srOperator idempotent proof | Measure instances |

## Meaning of steps 6–7

The quotient is a real Lean `Quotient`, not an `axiom`. The equivalence is still the trivial relation (all points identified), so the torus is a singleton — honest placeholder until the ℤ-span relation is filled in.
