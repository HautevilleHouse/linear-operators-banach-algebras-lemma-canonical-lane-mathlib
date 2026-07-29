import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure SpectralRadiusPackage where
  operator : Type u
  spectralRadius : operator → ℝ
  beurlingFormula : Prop
  spectralRadiusSubadditive : Prop
  spectralRadiusSubmultiplicative : Prop
  beurlingFormulaClosed : beurlingFormula
  spectralRadiusSubadditiveClosed : spectralRadiusSubadditive
  spectralRadiusSubmultiplicativeClosed : spectralRadiusSubmultiplicative

structure SpectralRadiusEvidence (R : SpectralRadiusPackage) where
  beurlingFormulaClosed : R.beurlingFormula
  spectralRadiusSubadditiveClosed : R.spectralRadiusSubadditive
  spectralRadiusSubmultiplicativeClosed : R.spectralRadiusSubmultiplicative

def SpectralRadiusClosed (R : SpectralRadiusPackage) : Prop :=
  R.beurlingFormula ∧ R.spectralRadiusSubadditive ∧ R.spectralRadiusSubmultiplicative

theorem spectral_radius_closed_from_evidence (R : SpectralRadiusPackage)
    (E : SpectralRadiusEvidence R) : SpectralRadiusClosed R := by
  exact And.intro E.beurlingFormulaClosed
    (And.intro E.spectralRadiusSubadditiveClosed E.spectralRadiusSubmultiplicativeClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse