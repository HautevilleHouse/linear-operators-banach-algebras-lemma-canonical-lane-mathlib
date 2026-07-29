import canonicalLaneMathlib.AdmissibleClass
import LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean.OperatorBanachAlgebra
import LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean.SpectralRadiusFormula

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure HolomorphicFunctionalCalculusPackage {A : OperatorBanachAlgebra} where
  element : A.carrier
  functionDefined : Prop
  spectralMapping : Prop

structure HolomorphicFunctionalCalculusEvidence {A : OperatorBanachAlgebra}
    (H : HolomorphicFunctionalCalculusPackage A) where
  functionDefinedClosed : H.functionDefined
  spectralMappingClosed : H.spectralMapping

def HolomorphicFunctionalCalculusClosed {A : OperatorBanachAlgebra}
    (H : HolomorphicFunctionalCalculusPackage A) : Prop :=
  H.functionDefined ∧ H.spectralMapping

theorem holomorphic_functional_calculus_closed_from_evidence
    {A : OperatorBanachAlgebra} (H : HolomorphicFunctionalCalculusPackage A)
    (E : HolomorphicFunctionalCalculusEvidence H) :
    HolomorphicFunctionalCalculusClosed H := by
  exact And.intro E.functionDefinedClosed E.spectralMappingClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse