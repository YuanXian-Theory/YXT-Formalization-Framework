# generate_A constraints

## Available defs

| Name | Role |
|------|------|
| `EmbeddingIndex` | Fin 64 |
| `CMTypeChoice` | Fin 32 → Fin 64 |
| `formalCMType` | i ↦ i (first 32 places) |
| `cmLatticeFromType` | formal lattice from CM type |
| `periodFromCMType` | periodMap ∘ cmLatticeFromType |
| `omegaCandidate` | identity (not CM) |

## Pipeline

```
formalCMType → cmLatticeFormal → periodFromCMType → (Riemann package?) → CMAbelian32
```

## Open

Replace formal embedding indices by actual complex embeddings of ℚ(ζ₈₅),
build Minkowski/CM lattice, prove polarization and Riemann package,
then define `generate_A t c := ℂ³² / lattice`.
