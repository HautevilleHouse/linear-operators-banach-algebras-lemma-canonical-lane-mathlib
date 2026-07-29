import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure GelfandTheoryPackage where
  algebra : Type u
  maximalIdealSpace : Type v
  gelfandTransform : algebra → (maximalIdealSpace → ℂ)
  isometricHomomorphism : Prop
  gelfandMazurTheorem : Prop
  isometricHomomorphismClosed : isometricHomomorphism
  gelfandMazurTheoremClosed : gelfandMazurTheorem

structure GelfandTheoryEvidence (G : GelfandTheoryPackage) where
  isometricHomomorphismClosed : G.isometricHomomorphism
  gelfandMazurTheoremClosed : G.gelfandMazurTheorem

def GelfandTheoryClosed (G : GelfandTheoryPackage) : Prop :=
  G.isometricHomomorphism ∧ G.gelfandMazurTheorem

theorem gelfand_theory_closed_from_evidence (G : GelfandTheoryPackage)
    (E : GelfandTheoryEvidence G) : GelfandTheoryClosed G := by
  exact And.intro E.isometricHomomorphismClosed E.gelfandMazurTheoremClosed

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse