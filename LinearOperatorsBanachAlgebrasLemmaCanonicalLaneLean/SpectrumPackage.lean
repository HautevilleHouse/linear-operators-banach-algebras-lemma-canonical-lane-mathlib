import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure SpectrumPackage where
  operator : Type u
  spectrumSet : operator → Set ℂ
  resolventSet : operator → Set ℂ
  spectralRadiusFormula : operator → ℝ
  spectrumNonempty : Prop
  spectralRadiusFinite : Prop
  spectralMappingTheorem : Prop
  spectrumNonemptyClosed : spectrumNonempty
  spectralRadiusFiniteClosed : spectralRadiusFinite
  spectralMappingTheoremClosed : spectralMappingTheorem

structure SpectrumEvidence (S : SpectrumPackage) where
  spectrumNonemptyClosed : S.spectrumNonempty
  spectralRadiusFiniteClosed : S.spectralRadiusFinite
  spectralMappingTheoremClosed : S.spectralMappingTheorem

def SpectrumClosed (S : SpectrumPackage) : Prop :=
  S.spectrumNonempty ∧ S.spectralRadiusFinite ∧ S.spectralMappingTheorem

theorem spectrum_closed_from_evidence (S : SpectrumPackage) (E : SpectrumEvidence S) :
    SpectrumClosed S := by
  exact And.intro E.spectrumNonemptyClosed
    (And.intro E.spectralRadiusFiniteClosed E.spectralMappingTheoremClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse