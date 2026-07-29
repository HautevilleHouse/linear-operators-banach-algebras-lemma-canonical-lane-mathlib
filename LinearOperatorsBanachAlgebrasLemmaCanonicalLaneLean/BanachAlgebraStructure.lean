import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure BanachAlgebraPackage where
  algebraType : Type u
  norm : Norm algebraType
  algebra : Algebra ℝ algebraType
  completeness : Prop
  multiplicativeInequality : Prop
  algebraMultiplicationContinuous : Prop

structure BanachAlgebraEvidence (B : BanachAlgebraPackage) where
  completenessClosed : B.completeness
  multiplicativeInequalityClosed : B.multiplicativeInequality
  algebraMultiplicationContinuousClosed : B.algebraMultiplicationContinuous

def BanachAlgebraClosed (B : BanachAlgebraPackage) : Prop :=
  B.completeness ∧ B.multiplicativeInequality ∧ B.algebraMultiplicationContinuous

theorem banach_algebra_closed_from_evidence (B : BanachAlgebraPackage) (E : BanachAlgebraEvidence B) :
    BanachAlgebraClosed B := by
  exact And.intro E.completenessClosed
    (And.intro E.multiplicativeInequalityClosed E.algebraMultiplicationContinuousClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse