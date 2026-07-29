import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure SpectralTheoryPackage where
  algebra : BanachAlgebraPackage
  element : algebra.algebraType
  spectrumNonempty : Prop
  spectralRadiusBounded : Prop
  functionalCalculusExists : Prop

structure SpectralTheoryEvidence (S : SpectralTheoryPackage) where
  spectrumNonemptyClosed : S.spectrumNonempty
  spectralRadiusBoundedClosed : S.spectralRadiusBounded
  functionalCalculusExistsClosed : S.functionalCalculusExists

def SpectralTheoryClosed (S : SpectralTheoryPackage) : Prop :=
  S.spectrumNonempty ∧ S.spectralRadiusBounded ∧ S.functionalCalculusExists

theorem spectral_theory_closed_from_evidence (S : SpectralTheoryPackage) (E : SpectralTheoryEvidence S) :
    SpectralTheoryClosed S := by
  exact And.intro E.spectrumNonemptyClosed
    (And.intro E.spectralRadiusBoundedClosed E.functionalCalculusExistsClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse