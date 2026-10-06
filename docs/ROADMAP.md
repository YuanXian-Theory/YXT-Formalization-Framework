# Roadmap — YXT-Formalization-Framework

## Phase 0 — Skeleton
- [x] Repository + lakefile + Mathlib dependency
- [x] Module tree
- [x] Epistemic headers

## Phase 1 — Reuse existing flesh
- [x] T64 AddCircle + CompactSpace
- [x] HeartField SRMF / involution
- [x] Cl6 combinatorial dim
- [x] Reduction35 regimes + stages 17–28
- [x] GENERATE_A_CONSTRAINTS.md

## Phase 2 — Easiest axiom eliminations (this push)
- [x] `Nat.totient 85 = 64`
- [x] Combinatorial Cl6 dimension
- [x] `coupling_jump_gt_five_percent` (analytic bound, no sorry)
- [x] `SRMF.has_unique_fixed_point` via Mathlib `ContractingWith`
- [x] `Cl6Mathlib := CliffordAlgebra Q6` type path + E6 finrank
- [x] `HilbertSpectrum.lean` SelfAdjointSpectrumReal interface
- [x] Stronger `NoOutside` semantic skeleton
- [ ] Wire `Cl6` abstract type ≃ `Cl6Mathlib` with full Algebra instances
- [ ] Prove `spectrum_real` from Mathlib once H_half is an InnerProductSpace
- [ ] Haar / sr_operator from ZFC-Extension RelativeConsistency

## Phase 3 — generate_A
- [x] Constraint sheet
- [ ] Period matrix candidate
- [ ] Riemann bilinear relations

## Phase 4 — Standard theory stack
- [ ] CyclotomicField Mathlib replacement
- [ ] ℓ-adic / CM / complex torus implementations

## Principle reminder
1. Reuse first  2. Label epistemic status  3. Interfaces before full proofs
