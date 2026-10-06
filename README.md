# YXT-Formalization-Framework

Yuanxian Theory formalization framework (Lean 4 + Mathlib).  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Modules

| Path | Role |
|------|------|
| `YXT/Axiomatic/` | NoOutside, SixLaws, T64, Cl6, Reduction35, PeriodMatrix, GenerateA |
| `YXT/Ontology/` | Four-layer hierarchy |
| `YXT/StandardTheory/` | Cyclotomic85, HilbertSpectrum, HaarSR, **EllAdic**, **CMAbelian**, **ComplexTorus**, **SpectralMatching** |
| `YXT/MindField/` | Ψ_SR / SRMF |

## Phase 4

CyclotomicField path · Tate/Frobenius · CM polarization · complex torus / Künneth interfaces · spectral matching (7.1 / 7.3).

## Build

```bash
git pull && lake exe cache get && lake build
```

[ROADMAP](docs/ROADMAP.md) · [GENERATE_A_CONSTRAINTS](docs/GENERATE_A_CONSTRAINTS.md) · [DOCKING](docs/DOCKING.md)
