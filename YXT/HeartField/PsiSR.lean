/-!
# DEPRECATED — moved to YXT.MindField.PsiSR

This file remains only as a redirect notice. Use `import YXT.MindField.PsiSR`.
-/

import YXT.MindField.PsiSR

-- Re-export under old namespace for one transition cycle
namespace YXT.HeartField
export YXT.MindField (IsInvolution IsFixedPoint SRMF PsiSRCarrier FixedPointEq evolve
  involution_fixed_point_unique_bool)
end YXT.HeartField
