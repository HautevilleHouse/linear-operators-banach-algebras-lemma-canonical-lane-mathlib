import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure HolomorphicFunctionalCalculusPackage (B : BanachAlgebraObject) where
  holomorphicCalculusDefined : Prop
  holomorphicMappingProperty : Prop
  spectralMappingTheorem : Prop
  compositionLift : Prop

structure HolomorphicFunctionalCalculusEvidence {B : BanachAlgebraObject}
    (H : HolomorphicFunctionalCalculusPackage B) where
  holomorphicCalculusDefinedClosed : H.holomorphicCalculusDefined
  holomorphicMappingPropertyClosed : H.holomorphicMappingProperty
  spectralMappingTheoremClosed : H.spectralMappingTheorem
  compositionLiftClosed : H.compositionLift

def HolomorphicFunctionalCalculusClosed {B : BanachAlgebraObject}
    (H : HolomorphicFunctionalCalculusPackage B) : Prop :=
  H.holomorphicCalculusDefined ∧ H.holomorphicMappingProperty ∧
  H.spectralMappingTheorem ∧ H.compositionLift

theorem holomorphic_functional_calculus_closed_from_evidence
    {B : BanachAlgebraObject} (H : HolomorphicFunctionalCalculusPackage B)
    (E : HolomorphicFunctionalCalculusEvidence H) :
    HolomorphicFunctionalCalculusClosed H := by
  exact And.intro E.holomorphicCalculusDefinedClosed
    (And.intro E.holomorphicMappingPropertyClosed
      (And.intro E.spectralMappingTheoremClosed E.compositionLiftClosed))

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse