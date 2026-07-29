import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure HolonomyPackage where
  parallelTransport : Type u
  holonomyGroup : Type v
  flatConnection : Prop
  ambroseSingerTheorem : Prop
  reductionHolonomy : Prop

structure HolonomyEvidence (H : HolonomyPackage) where
  flatConnectionClosed : H.flatConnection
  ambroseSingerTheoremClosed : H.ambroseSingerTheorem
  reductionHolonomyClosed : H.reductionHolonomy

def HolonomyClosed (H : HolonomyPackage) : Prop :=
  H.flatConnection ∧ H.ambroseSingerTheorem ∧ H.reductionHolonomy

theorem holonomy_closed_from_evidence (H : HolonomyPackage) (E : HolonomyEvidence H) :
    HolonomyClosed H := by
  exact And.intro E.flatConnectionClosed (And.intro E.ambroseSingerTheoremClosed E.reductionHolonomyClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse