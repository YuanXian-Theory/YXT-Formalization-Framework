# Docking map — existing YuanXian-Theory repos → this framework

| Existing repo | File / content | Target module here | Status |
|---------------|----------------|--------------------|--------|
| [ZFC-Extension](https://github.com/YuanXian-Theory/ZFC-Extension) | `lean/T64.lean`, `RelativeConsistency.lean` (Circle, CompactSpace, Haar) | `Axiomatic/T64.lean` | Partial (product CompactSpace done) |
| [ZFC-Extension](https://github.com/YuanXian-Theory/ZFC-Extension) | `lean/SRMF.lean` Banach fixed point | `HeartField/PsiSR.lean` | Interface ported |
| [Yuanxian-Consciousness](https://github.com/YuanXian-Theory/Yuanxian-Consciousness) | `Basic.lean` involution / fixed point | `HeartField/PsiSR.lean` | Interface ported |
| [YXT-Formalization](https://github.com/YuanXian-Theory/YXT-Formalization) | `Infinity/CliffordAlgebraCl6.lean` | `Axiomatic/Cl6.lean` | Combinatorial dim ported |
| [YXT-Formalization](https://github.com/YuanXian-Theory/YXT-Formalization) | `Reduction/StepReduction.lean`, `FullReductionChain.lean` | `Axiomatic/Reduction35.lean` | Regimes + coupling jump ported |
| [YXT-Formalization](https://github.com/YuanXian-Theory/YXT-Formalization) | `Infinity/T64Compact.lean` spectral gap | `Axiomatic/T64.lean` | Scale constant ported |
| [YXT-Formalization](https://github.com/YuanXian-Theory/YXT-Formalization) | `ZFC_Extension/SelfReferentialMindField.lean` | `HeartField/PsiSR.lean` | Structure aligned |

**Rule**: Prefer documented port over silent copy. Record provenance in module headers.
