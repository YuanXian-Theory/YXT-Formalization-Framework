# YXT-Formalization-Framework

Yuanxian Theory formalization framework (Lean 4 + Mathlib).  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Phase 3 (current)

- Block symplectic `J` on `Fin 32`
- `Lattice32` + `periodMap` interfaces
- `GenerateAPipeline` (T64 → lattice → Ω → CMAbelian32)
- CM type size 32 with `2 * 32 = φ(85)`

## Build

```bash
git pull && lake exe cache get && lake build
```

Docs: [ROADMAP](docs/ROADMAP.md) · [GENERATE_A_CONSTRAINTS](docs/GENERATE_A_CONSTRAINTS.md) · [DOCKING](docs/DOCKING.md)
