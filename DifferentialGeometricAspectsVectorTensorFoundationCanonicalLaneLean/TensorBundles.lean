import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure TensorBundlePackage (M : Type u) [TopologicalSpace M] where
  cotangentBundle : Type v
  tensorProductSpace : Type w
  symmetricTensorBundle : Type x
  alternatingTensorBundle : Type y
  bundleSmoothStructure : Prop
  bundleMetricInduced : Prop

structure TensorBundleEvidence {M : Type u} [TopologicalSpace M]
    (B : TensorBundlePackage M) where
  bundleSmoothStructureClosed : B.bundleSmoothStructure
  bundleMetricInducedClosed : B.bundleMetricInduced

def TensorBundleClosed {M : Type u} [TopologicalSpace M]
    (B : TensorBundlePackage M) : Prop :=
  B.bundleSmoothStructure ∧ B.bundleMetricInduced

theorem tensor_bundle_closed_from_evidence
    {M : Type u} [TopologicalSpace M] (B : TensorBundlePackage M)
    (E : TensorBundleEvidence B) : TensorBundleClosed B := by
  exact And.intro E.bundleSmoothStructureClosed E.bundleMetricInducedClosed

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse