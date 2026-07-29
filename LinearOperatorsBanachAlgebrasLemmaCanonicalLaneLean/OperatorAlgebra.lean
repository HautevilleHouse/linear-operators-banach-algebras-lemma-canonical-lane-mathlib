import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure OperatorAlgebraPackage where
  algebraCarrier : Type u
  norm : algebraCarrier → ℝ
  multiplication : algebraCarrier → algebraCarrier → algebraCarrier
  normedAlgebraAxioms : Prop
  completeNorm : Prop
  normedAlgebraAxiomsClosed : normedAlgebraAxioms
  completeNormClosed : completeNorm

structure OperatorAlgebraEvidence (A : OperatorAlgebraPackage) where
  normedAlgebraAxiomsClosed : A.normedAlgebraAxioms
  completeNormClosed : A.completeNorm

def OperatorAlgebraClosed (A : OperatorAlgebraPackage) : Prop :=
  A.normedAlgebraAxioms ∧ A.completeNorm

theorem operator_algebra_closed_from_evidence (A : OperatorAlgebraPackage)
    (E : OperatorAlgebraEvidence A) : OperatorAlgebraClosed A := by
  exact And.intro E.normedAlgebraAxiomsClosed E.completeNormClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse