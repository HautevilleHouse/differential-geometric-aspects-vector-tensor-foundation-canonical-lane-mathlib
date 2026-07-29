import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure HolonomyGroupPackage (M : Type u) [SmoothManifold M] where
  connection : ConnectionPackage M
  basepoint : M
  groupType : Type u
  representation : Type
  restrictedHolonomy : Prop
  classification : Prop

structure HolonomyGroupEvidence (H : HolonomyGroupPackage M) where
  groupTypeClosed : Nonempty (Group H.groupType)
  restrictedHolonomyClosed : H.restrictedHolonomy
  classificationClosed : H.classification

def HolonomyGroupClosed (H : HolonomyGroupPackage M) : Prop :=
  H.restrictedHolonomy ∧ H.classification

theorem holonomy_group_closed_from_evidence (H : HolonomyGroupPackage M) (E : HolonomyGroupEvidence H) :
    HolonomyGroupClosed H := by
  exact And.intro E.restrictedHolonomyClosed E.classificationClosed

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse