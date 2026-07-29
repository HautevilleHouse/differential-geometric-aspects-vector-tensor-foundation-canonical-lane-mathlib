import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure HolonomyPackage (M : Type u) [TopologicalSpace M] where
  holonomyGroup : Type v
  holonomyRepresentation : Type w
  ambroiseSingerTheorem : Prop
  reducedHolonomy : Prop
  holonomyClassification : Prop

structure HolonomyEvidence {M : Type u} [TopologicalSpace M]
    (H : HolonomyPackage M) where
  ambroiseSingerTheoremClosed : H.ambroiseSingerTheorem
  reducedHolonomyClosed : H.reducedHolonomy
  holonomyClassificationClosed : H.holonomyClassification

def HolonomyClosed {M : Type u} [TopologicalSpace M]
    (H : HolonomyPackage M) : Prop :=
  H.ambroiseSingerTheorem ∧ H.reducedHolonomy ∧ H.holonomyClassification

theorem holonomy_closed_from_evidence
    {M : Type u} [TopologicalSpace M] (H : HolonomyPackage M)
    (E : HolonomyEvidence H) : HolonomyClosed H := by
  exact And.intro E.ambroiseSingerTheoremClosed
    (And.intro E.reducedHolonomyClosed E.holonomyClassificationClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse