import canonicalLaneMathlib.AdmissibleClass
import LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean.OperatorBanachAlgebra

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure SpectralRadiusPackage {A : OperatorBanachAlgebra} where
  element : A.carrier
  spectralRadius : ℝ
  limitFormula : Prop

structure SpectralRadiusEvidence {A : OperatorBanachAlgebra} (S : SpectralRadiusPackage A) where
  limitFormulaClosed : S.limitFormula

def SpectralRadiusClosed {A : OperatorBanachAlgebra} (S : SpectralRadiusPackage A) : Prop :=
  S.limitFormula

theorem spectral_radius_closed_from_evidence {A : OperatorBanachAlgebra}
    (S : SpectralRadiusPackage A) (E : SpectralRadiusEvidence S) :
    SpectralRadiusClosed S := by
  exact E.limitFormulaClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse