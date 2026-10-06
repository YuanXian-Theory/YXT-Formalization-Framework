# YXT-Formalization-Framework

Yuanxian Theory formalization (Lean 4 + Mathlib)  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Carriers (no longer abstract axioms)

| Object | Definition |
|--------|------------|
| `Cl6` | `CliffordAlgebra (normSq on EuclideanSpace ℝ (Fin 6))` |
| `Cyclotomic85` | `CyclotomicField 85 ℚ` |
| `T64` | `Fin 64 → AddCircle 1` |

## Build

```bash
git pull && lake exe cache get && lake build
```

[ROADMAP](docs/ROADMAP.md) · [AXIOM_INVENTORY](docs/AXIOM_INVENTORY.md)

Import `YXT.MindField.PsiSR` only (not HeartField).
