import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure SpectralMappingPackage (B : BanachAlgebraObject) where
  spectralRadiusFormula : Prop
  spectralMappingProperty : Prop
  spectrumCompact : Prop
  spectrumNonempty : Prop

structure SpectralMappingEvidence {B : BanachAlgebraObject} (S : SpectralMappingPackage B) where
  spectralRadiusFormulaClosed : S.spectralRadiusFormula
  spectralMappingPropertyClosed : S.spectralMappingProperty
  spectrumCompactClosed : S.spectrumCompact
  spectrumNonemptyClosed : S.spectrumNonempty

def SpectralMappingClosed {B : BanachAlgebraObject} (S : SpectralMappingPackage B) : Prop :=
  S.spectralRadiusFormula ∧ S.spectralMappingProperty ∧ S.spectrumCompact ∧ S.spectrumNonempty

theorem spectral_mapping_closed_from_evidence
    {B : BanachAlgebraObject} (S : SpectralMappingPackage B)
    (E : SpectralMappingEvidence S) : SpectralMappingClosed S := by
  exact And.intro E.spectralRadiusFormulaClosed
    (And.intro E.spectralMappingPropertyClosed
      (And.intro E.spectrumCompactClosed E.spectrumNonemptyClosed))

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse