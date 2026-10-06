# generate_A steps 8–9

```lean
def inSpan L z := ∃ c, z = latticePoint L c
def latticeRel L x y := inSpan L (x - y)
-- refl / symm / trans: proved
def LatticeQuotient L := Quotient (latticeSetoid L)
```

Lattice points map to the zero class:
`quotient_latticePoint_eq_zero`.

Mind field (step 9):
`PsiSRCarrier := T64 → ℂ`.
