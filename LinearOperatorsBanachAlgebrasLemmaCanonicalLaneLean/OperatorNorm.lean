import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure OperatorNormPackage where
  domain : Type u
  codomain : Type v
  normOnDomain : Norm domain
  normOnCodomain : Norm codomain
  operatorBound : Prop
  linearMap : domain →ₗ[ℝ] codomain
  boundednessProperty : Prop

structure OperatorNormEvidence (P : OperatorNormPackage) where
  operatorBoundClosed : P.operatorBound
  boundednessPropertyClosed : P.boundednessProperty

def OperatorNormClosed (P : OperatorNormPackage) : Prop :=
  P.operatorBound ∧ P.boundednessProperty

theorem operator_norm_closed_from_evidence (P : OperatorNormPackage) (E : OperatorNormEvidence P) :
    OperatorNormClosed P := by
  exact And.intro E.operatorBoundClosed E.boundednessPropertyClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse