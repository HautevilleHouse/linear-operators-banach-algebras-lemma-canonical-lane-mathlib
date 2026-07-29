import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure BanachAlgebraSpace where
  carrier : Type
  norm : carrier → ℝ
  algebraStructure : Prop

structure BanachAlgebraAdmittedObject where
  space : BanachAlgebraSpace
  isBanachAlgebra : Prop
  operators : Type
  operatorNorm : operators → ℝ
  boundedOperators : Prop
  conclusion : boundedOperators

structure BanachAlgebraEndgameState where
  object : BanachAlgebraAdmittedObject

def BanachAlgebraWitnessClosed (O : BanachAlgebraAdmittedObject) : Prop :=
  O.boundedOperators

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse