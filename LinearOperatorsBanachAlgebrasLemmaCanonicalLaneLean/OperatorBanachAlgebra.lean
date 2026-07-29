import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure OperatorBanachAlgebra where
  carrier : Type u
  norm : carrier → ℝ
  algebraMul : carrier → carrier → carrier
  complete : Prop
  submultiplicative : ∀ x y : carrier, norm (algebraMul x y) ≤ norm x * norm y
  nonzero : Prop
  linearStructure : Prop

structure AdmissibleOperatorAlgebra (A : AdmissibleClass) where
  algebra : OperatorBanachAlgebra
  spectrumIncluded : Prop

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse