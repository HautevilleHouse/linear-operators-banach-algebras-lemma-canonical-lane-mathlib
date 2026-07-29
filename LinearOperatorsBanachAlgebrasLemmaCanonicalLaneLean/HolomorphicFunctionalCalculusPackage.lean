import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure HolomorphicFunctionalCalculusPackage where
  operator : Type u
  holomorphicFunctions : Set (ℂ → ℂ)
  functionalCalculusMap : (ℂ → ℂ) → operator → operator
  homomorphismProperty : Prop
  spectralMappingProperty : Prop
  homomorphismPropertyClosed : homomorphismProperty
  spectralMappingPropertyClosed : spectralMappingProperty

structure HolomorphicFunctionalCalculusEvidence
    (H : HolomorphicFunctionalCalculusPackage) where
  homomorphismPropertyClosed : H.homomorphismProperty
  spectralMappingPropertyClosed : H.spectralMappingProperty

def HolomorphicFunctionalCalculusClosed (H : HolomorphicFunctionalCalculusPackage) : Prop :=
  H.homomorphismProperty ∧ H.spectralMappingProperty

theorem holomorphic_functional_calculus_closed_from_evidence
    (H : HolomorphicFunctionalCalculusPackage)
    (E : HolomorphicFunctionalCalculusEvidence H) :
    HolomorphicFunctionalCalculusClosed H := by
  exact And.intro E.homomorphismPropertyClosed E.spectralMappingPropertyClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse