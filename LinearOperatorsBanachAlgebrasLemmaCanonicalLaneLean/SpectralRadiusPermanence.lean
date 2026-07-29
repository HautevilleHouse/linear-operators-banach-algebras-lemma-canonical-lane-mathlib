import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure UnitalBanachAlgebraPackage (B : BanachAlgebraPackage) where
  unit : B.carrier
  unitLeft : ∀ x : B.carrier, B.algebraMul unit x = x
  unitRight : ∀ x : B.carrier, B.algebraMul x unit = x
  normUnit : B.norm unit = 1

structure UnitalBanachAlgebraEvidence (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B) where
  unitLeftClosed : U.unitLeft
  unitRightClosed : U.unitRight
  normUnitClosed : U.normUnit

def UnitalBanachAlgebraClosed (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B) : Prop :=
  U.unitLeft ∧ U.unitRight ∧ U.normUnit

theorem unital_banach_algebra_closed_from_evidence (B : BanachAlgebraPackage)
    (U : UnitalBanachAlgebraPackage B) (E : UnitalBanachAlgebraEvidence B U) :
    UnitalBanachAlgebraClosed B U := by
  exact And.intro E.unitLeftClosed (And.intro E.unitRightClosed E.normUnitClosed)

def spectralRadius {B : BanachAlgebraPackage} {U : UnitalBanachAlgebraPackage B} (x : B.carrier) : ℝ :=
  sSup {|λ| : ℝ : λ : ℝ ∧ ¬∃ (y : B.carrier), B.algebraMul (B.algebraScalar (-λ) unit + y) (B.algebraScalar λ unit - x) = unit}

structure SpectralRadiusPermanenceLemma (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B)
    (A : Subalgebra B) where
  subalgebraInclusion : A → B.carrier
  spectralRadiusSubalgebra : ∀ x : A, spectralRadius (subalgebraInclusion x) = spectralRadius x

structure SpectralRadiusPermanenceEvidence (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B)
    (A : Subalgebra B) (P : SpectralRadiusPermanenceLemma B U A) where
  subalgebraInjectionClosed : P.subalgebraInclusion
  spectralRadiusEqualityClosed : P.spectralRadiusSubalgebra

def SpectralRadiusPermanenceClosed (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B)
    (A : Subalgebra B) (P : SpectralRadiusPermanenceLemma B U A) : Prop :=
  P.spectralRadiusSubalgebra

theorem spectral_radius_permanence_closed_from_evidence (B : BanachAlgebraPackage)
    (U : UnitalBanachAlgebraPackage B) (A : Subalgebra B)
    (P : SpectralRadiusPermanenceLemma B U A) (E : SpectralRadiusPermanenceEvidence B U A P) :
    SpectralRadiusPermanenceClosed B U A P := by
  exact E.spectralRadiusEqualityClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse