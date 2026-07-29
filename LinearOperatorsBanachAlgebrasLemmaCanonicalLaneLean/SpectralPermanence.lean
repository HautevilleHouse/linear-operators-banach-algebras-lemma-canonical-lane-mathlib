import canonicalLaneMathlib.AdmissibleClass
import LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean.OperatorBanachAlgebra

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure SpectralPermanencePackage {A : OperatorBanachAlgebra} (B : OperatorBanachAlgebra) where
  subalgebraInclusion : B.carrier → A.carrier
  isClosedSubalgebra : Prop
  isInverseClosed : Prop

structure SpectralPermanenceEvidence {A : OperatorBanachAlgebra} {B : OperatorBanachAlgebra}
    (S : SpectralPermanencePackage A B) where
  isClosedSubalgebraClosed : S.isClosedSubalgebra
  isInverseClosedClosed : S.isInverseClosed

def SpectralPermanenceClosed {A : OperatorBanachAlgebra} {B : OperatorBanachAlgebra}
    (S : SpectralPermanencePackage A B) : Prop :=
  S.isClosedSubalgebra ∧ S.isInverseClosed

theorem spectral_permanence_closed_from_evidence {A : OperatorBanachAlgebra}
    {B : OperatorBanachAlgebra} (S : SpectralPermanencePackage A B)
    (E : SpectralPermanenceEvidence S) : SpectralPermanenceClosed S := by
  exact And.intro E.isClosedSubalgebraClosed E.isInverseClosedClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse