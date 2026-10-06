# Roadmap — YXT-Formalization-Framework

## Naming
- English only · 自指心场 → **MindField**

## Phase 0–3
- [x] Skeleton, T64, Cl6, Reduction35, MindField, HaarSR, PeriodMatrix, GenerateAPipeline

## Phase 4 (this push)
- [x] `Cyclotomic85Mathlib := CyclotomicField 85 ℚ` + equiv bridge
- [x] `EllAdic.lean` — TateModule, FrobeniusAction, EulerFactor
- [x] `CMAbelian.lean` — CMTypeOf, PrincipalPolarization, Shimura–Taniyama interface
- [x] `ComplexTorus.lean` — ComplexTorus, Hk, Künneth rank interface, choose(64,k) samples
- [x] `SpectralMatching.lean` — theorems 7.1 / 7.3 interfaces
- [ ] Replace abstract types by full Mathlib defs (no axiom bridges)
- [ ] Prove Künneth ranks and Gal(ℚ(ζ₈₅)/ℚ) card from Mathlib

## Later
- [ ] Explicit polarized lattice → Ω
- [ ] Zero-sorry pipeline for generate_A
