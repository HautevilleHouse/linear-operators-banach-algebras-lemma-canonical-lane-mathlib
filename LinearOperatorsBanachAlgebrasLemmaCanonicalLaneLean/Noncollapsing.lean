import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure NoncollapsingPackage where
  normBound : Prop
  spectralRadiusBound : Prop
  continuityCondition : Prop

structure NoncollapsingEvidence (N : NoncollapsingPackage) where
  normBoundClosed : N.normBound
  spectralRadiusBoundClosed : N.spectralRadiusBound
  continuityConditionClosed : N.continuityCondition

def NoncollapsingClosed (N : NoncollapsingPackage) : Prop :=
  N.normBound ∧ N.spectralRadiusBound ∧ N.continuityCondition

theorem noncollapsing_closed_from_evidence (N : NoncollapsingPackage) (E : NoncollapsingEvidence N) : NoncollapsingClosed N := by
  exact And.intro E.normBoundClosed (And.intro E.spectralRadiusBoundClosed E.continuityConditionClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse