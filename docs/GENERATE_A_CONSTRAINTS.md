# generate_A constraints (Phase 3+)

## Explicit formal objects (now in Lean)

| Object | Definition |
|--------|------------|
| `standardLattice` | Unit basis of ℂ³² |
| `omegaCandidate` / `periodMapStandard` | Identity 32×32 matrix |
| `formalOmega` | Same as periodMapStandard |
| `symplecticJ` | Block symplectic form |

## Sanity theorems

- `omegaCandidate i i = 1`
- `latticeRealRank = 64`
- stages 17–28 length 12

## Not yet proven

- `RiemannBilinearZero omegaCandidate` (identity generally does **not** satisfy the period relations; a true Ω must come from a polarized lattice)
- CM compatibility of the candidate
- Replacement of `generate_A` axiom

## Next construction step

Build lattice from 32 embeddings of ℚ(ζ₈₅) (CM type) and set Ω_{ij} = period integrals; then verify Riemann package.
