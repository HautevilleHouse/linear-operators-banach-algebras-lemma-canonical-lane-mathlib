import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean

structure MathlibProofObligation where
  sourceKey : String
  theoremName : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation :=
  { sourceKey := "linear_operators_banach_algebras_lemma",
    theoremName := "Linear Operators Banach Algebras Lemma",
    commonCoreImported := true,
    theoremSpecificDefinitionsNative := true,
    theoremSpecificBridgeNative := true,
    theoremSpecificAdmittedClosureNative := true,
    unrestrictedClassicalClosureNative := false,
    carriedGap := "Unrestricted classical closure remains carried; the admissible-class bridge closes over the Banach algebra admitted object."
  }

end LinearOperatorsBanachAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse