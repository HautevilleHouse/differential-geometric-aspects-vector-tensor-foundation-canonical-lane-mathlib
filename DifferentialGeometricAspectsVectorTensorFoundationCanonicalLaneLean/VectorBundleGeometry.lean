import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure VectorBundlePackage (M : Type u) [TopologicalSpace M] where
  fiber : Type v
  projection : fiber → M
  trivializationAtlas : Set (Set M)
  transitionFunctions : Prop
  smoothStructure : Prop

structure VectorBundleEvidence {M : Type u} [TopologicalSpace M] (V : VectorBundlePackage M) where
  projectionContinuous : Continuous V.projection
  trivializationCover : ∀ x : M, ∃ U ∈ V.trivializationAtlas, x ∈ U
  transitionSmooth : V.transitionFunctions

def VectorBundleClosed {M : Type u} [TopologicalSpace M] (V : VectorBundlePackage M) : Prop :=
  V.transitionFunctions ∧ V.smoothStructure

theorem vector_bundle_closed_from_evidence {M : Type u} [TopologicalSpace M]
    (V : VectorBundlePackage M) (E : VectorBundleEvidence V) : VectorBundleClosed V := by
  exact And.intro E.transitionSmooth V.smoothStructure

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse