# generate_A (steps 4–5)

## Definitions now in Lean

```
CMAbelian32 := LatticeQuotient cmLatticeFormal
generate_A_def t c := Classical.choice (nonempty quotient)
formalPipeline t c := { formalCMType, cmLatticeFormal, Ω, variety }
```

## Still open

1. Replace `axiom LatticeQuotient` with
   `ℂ³² ⧸ latticeSubgroup L` (Mathlib `AddSubgroup` + quotient).
2. Build L from Minkowski embeddings of ℚ(ζ₈₅) under a true CM type.
3. Prove `IsPrincipallyPolarized L` without axiom.
4. Feed stages 17–28 of the reduction chain into the lattice construction.
