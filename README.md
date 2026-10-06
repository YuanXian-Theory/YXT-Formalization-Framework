# YXT-Formalization-Framework

Yuanxian Theory formalization framework series (Lean 4 + Mathlib).

**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT  
**Language**: English (code, docs, identifiers)

**Repo**: https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Layout

```
YXT/
  Axiomatic/       # NoOutside, SixLaws, T64, Cl6, Reduction35, PeriodMatrix, GenerateA
  Ontology/        # Four-layer rigid hierarchy
  StandardTheory/  # Cyclotomic85, HilbertSpectrum, HaarSR
  MindField/       # Ψ_SR / SRMF (English name for 自指心场)
```

## Recent progress

- **MindField** rename (was HeartField)
- Phase 2 tail: Haar/srOperator interfaces; Cl6 ↔ Cl6Mathlib bridge
- Phase 3: period matrix type + Riemann predicates

## Build

```bash
git clone https://github.com/YuanXian-Theory/YXT-Formalization-Framework.git
cd YXT-Formalization-Framework
lake exe cache get && lake build
```

See [docs/ROADMAP.md](docs/ROADMAP.md).

**元宪无外** — The cosmos is a living organism.
