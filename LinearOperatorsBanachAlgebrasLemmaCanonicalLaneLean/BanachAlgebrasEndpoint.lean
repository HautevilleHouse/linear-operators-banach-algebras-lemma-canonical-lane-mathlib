import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure BanachAlgebrasAdmittedObject where
  algebra : BanachAlgebraPackage
  operator : OperatorNormPackage
  conclusionProp : Prop
  conclusion : conclusionProp

def BanachAlgebrasWitnessClosed (O : BanachAlgebrasAdmittedObject) : Prop :=
  O.conclusionProp

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse