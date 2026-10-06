# Construction constraints for `generate_A` (Phase 3)

**Language**: English  
**Lean**: `PeriodMatrix.lean`, `GenerateA.lean`, `Cyclotomic85.lean`

## Pipeline

```
T64  --(steps 17..28)--&gt;  Lattice32  --(periodMap)--&gt;  PeriodMatrix Ω
         |                                                      |
         +-- Cl6 graded channel -------------------------------+
                                                                v
                                                         CMAbelian32
```

`GenerateAPipeline` packages `(torus, clifford, lattice, Ω, riemann, variety)`.

## Period matrix

| Item | Lean |
|------|------|
| Type | `Matrix (Fin 32) (Fin 32) ℂ` |
| Symplectic J | `symplecticJ` block form on Fin 32 |
| Riemann (1) | `RiemannBilinearZero` = `Ωᵀ J Ω = 0` |
| Riemann (2) | `RiemannBilinearPos` (axiom) |
| Lattice | `Lattice32`, `periodMap` |

## CM type

- `φ(85) = 64` embeddings (`totient_85`)
- CM type picks **32** places: `2 * cmTypeCardinality = totient 85`

## Stages

- `stagesForGenerateA = [17,...,28]` length 12
- All indices `&lt; 35`

## Still open (Phase 3+)

1. Explicit ℤ-basis of a polarized lattice in ℂ³²
2. Closed-form Ω entries and proof of `RiemannBilinearZero` for that Ω
3. Proof of positivity / principal polarization
4. `generate_A` as a `def` using the pipeline instead of `axiom`
