import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : BanachAlgebraObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OperatorAdmissible A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse