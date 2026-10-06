# YXT-Formalization-Framework

Yuanxian Theory formalization (Lean 4 + Mathlib)  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Generation path (type level)

```
T64 × Cl6  --generate_A_def--&gt;  CMAbelian32
                              := LatticeQuotient cmLatticeFormal
```

| Object | Status |
|--------|--------|
| T64, Cl6, Cyclotomic85, haarOnT64 | **defs** |
| PolarizedLattice / formalPipeline | **defs** |
| CMAbelian32 / generate_A_def | **defs** over quotient axiom |
| Arithmetic CM Riemann package | **open** |

```bash
git pull && lake build
```

Prefer `generate_A_def` over the transitional `generate_A` (contains `sorry`).
