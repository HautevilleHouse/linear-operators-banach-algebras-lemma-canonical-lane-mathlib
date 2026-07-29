import canonicalLaneMathlib.AdmissibleClass
import LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean.OperatorBanachAlgebra
import LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean.SpectralRadiusFormula

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure GelfandMazurPackage {A : OperatorBanachAlgebra} where
  algebra : A
  divisionAlgebra : Prop
  isIsomorphicToComplex : Prop

structure GelfandMazurEvidence {A : OperatorBanachAlgebra} (G : GelfandMazurPackage A) where
  divisionAlgebraClosed : G.divisionAlgebra
  isIsomorphicToComplexClosed : G.isIsomorphicToComplex

def GelfandMazurClosed {A : OperatorBanachAlgebra} (G : GelfandMazurPackage A) : Prop :=
  G.divisionAlgebra ∧ G.isIsomorphicToComplex

theorem gelfand_mazur_closed_from_evidence {A : OperatorBanachAlgebra}
    (G : GelfandMazurPackage A) (E : GelfandMazurEvidence G) :
    GelfandMazurClosed G := by
  exact And.intro E.divisionAlgebraClosed E.isIsomorphicToComplexClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse