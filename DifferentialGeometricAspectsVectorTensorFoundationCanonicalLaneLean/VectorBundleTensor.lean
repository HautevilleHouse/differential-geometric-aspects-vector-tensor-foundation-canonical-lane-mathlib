import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure VectorBundleTensorPackage where
  vectorBundle : Type u
  tensorProduct : Type v
  sectionSheaf : Type w
  smoothStructure : Prop
  connectionCompatible : Prop
  curvatureEndomorphism : Prop

structure VectorBundleTensorEvidence (V : VectorBundleTensorPackage) where
  smoothStructureClosed : V.smoothStructure
  connectionCompatibleClosed : V.connectionCompatible
  curvatureEndomorphismClosed : V.curvatureEndomorphism

def VectorBundleTensorClosed (V : VectorBundleTensorPackage) : Prop :=
  V.smoothStructure ∧ V.connectionCompatible ∧ V.curvatureEndomorphism

theorem vector_bundle_tensor_closed_from_evidence (V : VectorBundleTensorPackage)
    (E : VectorBundleTensorEvidence V) : VectorBundleTensorClosed V := by
  exact And.intro E.smoothStructureClosed (And.intro E.connectionCompatibleClosed E.curvatureEndomorphismClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse