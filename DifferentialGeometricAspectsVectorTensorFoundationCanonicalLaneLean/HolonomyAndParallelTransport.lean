import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.TensorInvariants

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure HolonomyPackage {O : DifferentialGeometricAdmittedObject} where
  holonomyGroup : Type
  parallelTransport : Type
  curvingFlatness : Prop
  ambroiseSingerTheorem : Prop
  holonomyReduction : Prop

default

structure HolonomyEvidence {O : DifferentialGeometricAdmittedObject} (H : HolonomyPackage O) where
  curvingFlatnessClosed : H.curvingFlatness
  ambroiseSingerTheoremClosed : H.ambroiseSingerTheorem
  holonomyReductionClosed : H.holonomyReduction

def HolonomyClosed {O : DifferentialGeometricAdmittedObject} (H : HolonomyPackage O) : Prop :=
  H.curvingFlatness ∧ H.ambroiseSingerTheorem ∧ H.holonomyReduction

theorem holonomy_closed_from_evidence {O : DifferentialGeometricAdmittedObject} (H : HolonomyPackage O) (E : HolonomyEvidence H) :
    HolonomyClosed H := by
  exact And.intro E.curvingFlatnessClosed (And.intro E.ambroiseSingerTheoremClosed E.holonomyReductionClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse