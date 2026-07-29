import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure EndomorphismStructurePackage where
  endomorphismAlgebra : Prop
  spectrumCompact : Prop
  resolventSet : Prop
  spectralMappingTheorem : Prop

structure EndomorphismStructureEvidence (E : EndomorphismStructurePackage) where
  endomorphismAlgebraClosed : E.endomorphismAlgebra
  spectrumCompactClosed : E.spectrumCompact
  resolventSetClosed : E.resolventSet
  spectralMappingTheoremClosed : E.spectralMappingTheorem

def EndomorphismStructureClosed (E : EndomorphismStructurePackage) : Prop :=
  E.endomorphismAlgebra ∧ E.spectrumCompact ∧ E.resolventSet ∧ E.spectralMappingTheorem

theorem endomorphism_structure_closed_from_evidence (E : EndomorphismStructurePackage) (Ev : EndomorphismStructureEvidence E) : EndomorphismStructureClosed E := by
  exact And.intro Ev.endomorphismAlgebraClosed (And.intro Ev.spectrumCompactClosed (And.intro Ev.resolventSetClosed Ev.spectralMappingTheoremClosed))

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse