import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure BanachAlgebraObject where
  algebraType : Type
  norm : algebraType → ℝ
  completeness : Prop
  submultiplicativity : Prop
  spectralRadius : algebraType → ℝ
  spectrum : algebraType → Set ℂ
  conclusion : OperatorAdmissible this

def OperatorAdmissible (O : BanachAlgebraObject) : Prop :=
  O.submultiplicativity ∧ O.completeness

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse