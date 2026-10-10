import Lake
open Lake DSL

package «YXT-Formalization-Framework» where
  -- package config

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.26.0"

@[default_target]
lean_lib «YXT» where
  -- library config
