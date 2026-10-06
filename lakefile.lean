import Lake
open Lake DSL

package «YXT-Formalization-Framework» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «YXT» where
  -- add library configuration options here
