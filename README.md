# YXT-Formalization-Framework

**Yuanxian Theory Formalization Framework Series**  
Ontological anchoring → Standard theory stack → Axiomatic reconstruction  
Lean 4 + Mathlib

**Author**: Zhenyuan Acharya (真圆阿奢黎)  
**Institution**: Institute of Yuanxian Cosmology  
**License**: MIT  
**Status**: Skeleton complete · Flesh filling in progress (Phase 0–1)

---

## Series documents

| Document | Role |
|----------|------|
| Formalization Foundation | Interface layer (four-layer rigid ontology, backtracking, five core theorems) |
| Standard Theory | Formalization framework for cited standard theories |
| Axiomatic Reconstruction | From “cosmos has no outside” to generation of CM abelian variety \(A\) |
| Series Overview (OVR) | Glossary, citation network, inventory, roadmap |

---

## Repository layout

```
YXT/
  Axiomatic/     # NoOutside, SixLaws, T64, Cl6, Reduction35, GenerateA
  Ontology/      # FourLayer, Backtracking, FiveTheorems
  StandardTheory/# Cyclotomic85, HilbertSpectrum, EllAdic, CMAbelian32, ComplexTorus
  HeartField/    # PsiSR, FixedPoint (absorb from existing repos)
docs/
  ROADMAP.md
  EPISTEMIC_STATUS.md
  DOCKING.md
papers/          # LaTeX sources of the four framework papers (optional)
```

---

## Three principles

1. **Reuse first** — migrate zero-`sorry` code from existing YuanXian-Theory repos before writing new axioms.
2. **Explicit epistemic status** — every module header states: Axiom / Cited standard theory / Phenomenological / Proven.
3. **Interfaces before proofs** — framework contracts compile first; Mathlib-backed replacements follow the roadmap.

---

## Quick start

```bash
git clone https://github.com/YuanXian-Theory/YXT-Formalization-Framework.git
cd YXT-Formalization-Framework
lake exe cache get
lake build
```

Requires [elan](https://lean-lang.org/) and a recent Lean 4 toolchain.

---

## Current maturity

| Layer | Status |
|-------|--------|
| Architecture & API contracts | Done |
| T64 / Cl6 Mathlib-oriented defs | Phase 1 started |
| Standard theory implementations | Axiom interfaces only |
| `generate_A` construction rule | Constraint doc pending |
| 35-step cascade content | To dock existing machine proof |

See [docs/ROADMAP.md](docs/ROADMAP.md) and [docs/DOCKING.md](docs/DOCKING.md).

---

**元宪无外。** The cosmos is a living organism.
