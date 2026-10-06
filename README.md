# YXT-Formalization-Framework

Yuanxian Theory formalization (Lean 4 + Mathlib)  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Steps 6–7

- `LatticeQuotient` is a **definition** (`Quotient`), not an axiom
- `generate_A` is a **definition** with **no sorry**
- Stage window 17–28 is wired (`StageWindow`, nodup)

Limitation: lattice equivalence is still trivial (`True`); torus is a singleton until the span relation is implemented.

```bash
git pull && lake build
```
