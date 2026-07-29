import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure GelfandTheoryPackage (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B) where
  characterSpace : Type u
  characterMap : characterSpace → B.carrier → ℂ
  characterLinear : ∀ φ : characterSpace, ∀ x y : B.carrier, ∀ a : ℂ,
    characterMap φ (B.algebraScalar a.real x + y) = a * characterMap φ x + characterMap φ y
  characterMultiplicative : ∀ φ : characterSpace, ∀ x y : B.carrier,
    characterMap φ (B.algebraMul x y) = characterMap φ x * characterMap φ y
  characterUnit : ∀ φ : characterSpace, characterMap φ U.unit = 1
  characterNormBound : ∀ φ : characterSpace, ∀ x : B.carrier,
    |characterMap φ x| ≤ B.norm x

def gelfandTransform {B : BanachAlgebraPackage} {U : UnitalBanachAlgebraPackage B}
    (G : GelfandTheoryPackage B U) (x : B.carrier) : G.characterSpace → ℂ :=
  λ φ => G.characterMap φ x

structure GelfandTransformLemma (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B)
    (G : GelfandTheoryPackage B U) where
  gelfandTransformIsContraction : ∀ x : B.carrier, sup (|gelfandTransform G x φ|) ≤ B.norm x
  gelfandTransformInjective : ∀ x : B.carrier, (∀ φ : G.characterSpace, gelfandTransform G x φ = 0) → x = 0
  spectralRadiusEqualsSup : ∀ x : B.carrier, spectralRadius x = sup (|gelfandTransform G x φ|)

structure GelfandTransformEvidence (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B)
    (G : GelfandTheoryPackage B U) (L : GelfandTransformLemma B U G) where
  contractionClosed : L.gelfandTransformIsContraction
  injectiveClosed : L.gelfandTransformInjective
  spectralRadiusSupClosed : L.spectralRadiusEqualsSup

def GelfandTransformClosed (B : BanachAlgebraPackage) (U : UnitalBanachAlgebraPackage B)
    (G : GelfandTheoryPackage B U) (L : GelfandTransformLemma B U G) : Prop :=
  L.gelfandTransformIsContraction ∧ L.gelfandTransformInjective ∧ L.spectralRadiusEqualsSup

theorem gelfand_transform_closed_from_evidence (B : BanachAlgebraPackage)
    (U : UnitalBanachAlgebraPackage B) (G : GelfandTheoryPackage B U)
    (L : GelfandTransformLemma B U G) (E : GelfandTransformEvidence B U G L) :
    GelfandTransformClosed B U G L := by
  exact And.intro E.contractionClosed (And.intro E.injectiveClosed E.spectralRadiusSupClosed)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse