# Progress

## CI
- Mathlib v4.26.0 green (T64, Cl6, Haar, CM interfaces)

## omega / Cl6
| Item | Status |
|------|--------|
| Q6, Cl6 carrier | proved / Mathlib |
| e6 frame, iota6, omega | defined |
| Q6_e6 (‖eᵢ‖² = 1) | theorem |
| iota6_sq (ι(eᵢ)² = 1) | theorem |
| sign exponent 15 | theorem |
| omega_sq = -1 | **narrowed axiom** (was ∨ ±1); anticommutation walk pending |

## Haar / CM
- haarUnit + haarT64 interface green
- PeriodMatrix over ℂ, generate_A, RBR interface green

## Next
1. Anticommutation walk for omega_sq (remove last axiom)
2. latticeRel → Submodule.span
3. IsProbabilityMeasure on haarT64
