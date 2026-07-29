import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure BallAlgebraPackage where
  ballMultiplication : Prop
  ballClosure : Prop
  spectralBehavior : Prop
  functionalCalculus : Prop

structure BallAlgebraEvidence (B : BallAlgebraPackage) where
  ballMultiplicationClosed : B.ballMultiplication
  ballClosureClosed : B.ballClosure
  spectralBehaviorClosed : B.spectralBehavior
  functionalCalculusClosed : B.functionalCalculus

def BallAlgebraClosed (B : BallAlgebraPackage) : Prop :=
  B.ballMultiplication ∧ B.ballClosure ∧ B.spectralBehavior ∧ B.functionalCalculus

theorem ball_algebra_closed_from_evidence (B : BallAlgebraPackage) (E : BallAlgebraEvidence B) : BallAlgebraClosed B := by
  exact And.intro E.ballMultiplicationClosed (And.intro E.ballClosureClosed (And.intro E.spectralBehaviorClosed E.functionalCalculusClosed))

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse