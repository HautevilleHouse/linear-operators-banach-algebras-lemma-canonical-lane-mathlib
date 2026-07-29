import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure BanachAlgebraPackage where
  carrier : Type u
  norm : carrier → ℝ
  algebraMul : carrier → carrier → carrier
  algebraAdd : carrier → carrier → carrier
  algebraScalar : ℝ → carrier → carrier
  normedAddCommGroup : NormedAddCommGroup carrier
  normedRing : NormedRing carrier
  normMultiplicative : ∀ x y : carrier, norm (algebraMul x y) ≤ norm x * norm y
  complete : MetricSpace carrier

structure BanachAlgebraEvidence (B : BanachAlgebraPackage) where
  normMultiplicativeClosed : B.normMultiplicative
  completeClosed : B.complete

def BanachAlgebraClosed (B : BanachAlgebraPackage) : Prop :=
  B.normMultiplicative ∧ B.complete

theorem banach_algebra_closed_from_evidence (B : BanachAlgebraPackage)
    (E : BanachAlgebraEvidence B) : BanachAlgebraClosed B := by
  exact And.intro E.normMultiplicativeClosed E.completeClosed

structure LinearOperatorPackage (B : BanachAlgebraPackage) where
  domain : Type u
  codomain : Type u
  operator : domain → codomain
  linearity : ∀ (x y : domain) (a : ℝ), operator (a • x + y) = a • operator x + operator y
  boundedness : ∃ C : ℝ, ∀ x : domain, ‖operator x‖ ≤ C * ‖x‖

def operatorNorm {B : BanachAlgebraPackage} (L : LinearOperatorPackage B) : ℝ :=
  sInf {C : ℝ | ∀ x : L.domain, ‖L.operator x‖ ≤ C * ‖x‖}

structure LinearOperatorEvidence (B : BanachAlgebraPackage) (L : LinearOperatorPackage B) where
  linearityClosed : L.linearity
  boundednessClosed : L.boundedness

def LinearOperatorClosed (B : BanachAlgebraPackage) (L : LinearOperatorPackage B) : Prop :=
  L.linearity ∧ L.boundedness

theorem linear_operator_closed_from_evidence (B : BanachAlgebraPackage)
    (L : LinearOperatorPackage B) (E : LinearOperatorEvidence B L) :
    LinearOperatorClosed B L := by
  exact And.intro E.linearityClosed E.boundednessClosed

structure OperatorNormLemmaPackage (B : BanachAlgebraPackage) (L : LinearOperatorPackage B) where
  operatorNormFinite : operatorNorm L < ∞
  normInequality : ∀ x : L.domain, ‖L.operator x‖ ≤ operatorNorm L * ‖x‖
  operatorNormAsSup :
    operatorNorm L = sSup {‖L.operator x‖ / ‖x‖ | x : L.domain, x ≠ 0}

structure OperatorNormLemmaEvidence (B : BanachAlgebraPackage) (L : LinearOperatorPackage B)
    (P : OperatorNormLemmaPackage B L) where
  operatorNormFiniteClosed : P.operatorNormFinite
  normInequalityClosed : P.normInequality
  operatorNormAsSupClosed : P.operatorNormAsSup

def OperatorNormLemmaClosed (B : BanachAlgebraPackage) (L : LinearOperatorPackage B)
    (P : OperatorNormLemmaPackage B L) : Prop :=
  P.operatorNormFinite ∧ P.normInequality ∧ P.operatorNormAsSup

theorem operator_norm_lemma_closed_from_evidence (B : BanachAlgebraPackage)
    (L : LinearOperatorPackage B) (P : OperatorNormLemmaPackage B L)
    (E : OperatorNormLemmaEvidence B L P) : OperatorNormLemmaClosed B L P := by
  exact And.intro E.operatorNormFiniteClosed
    (And.intro E.normInequalityClosed E.operatorNormAsSupClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse