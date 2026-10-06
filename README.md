# YXT-Formalization-Framework

Yuanxian Theory formalization (Lean 4 + Mathlib)  
**Author**: Zhenyuan Acharya · Institute of Yuanxian Cosmology  
**License**: MIT · **Language**: English

https://github.com/YuanXian-Theory/YXT-Formalization-Framework

## Defined carriers / measures

| Object | Definition |
|--------|------------|
| `T64` | `Fin 64 → AddCircle 1` |
| `Cl6` | `CliffordAlgebra (normSq on ℝ⁶)` |
| `Cyclotomic85` | `CyclotomicField 85 ℚ` |
| `haarOnT64` | `Measure.pi (fun _ => addHaar)` |
| `srOperator f` | `fun _ => ∫ y, f y ∂ haarOnT64` |

```bash
git pull && lake build
```

[ROADMAP](docs/ROADMAP.md) · [AXIOM_INVENTORY](docs/AXIOM_INVENTORY.md)
