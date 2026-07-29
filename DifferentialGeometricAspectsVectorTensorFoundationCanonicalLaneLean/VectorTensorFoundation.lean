import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.RiemannianCurvature
import Mathlib.LinearAlgebra.TensorProduct

/-!
# Vector Tensor Foundation Package
-/

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure VectorBundlePackage where
  baseManifold : Type u
  fiber : Type v
  projection : Type w
  localTrivialization : Prop
  smoothStructure : Prop
  vectorSpaceStructure : Prop
  transitionFunctionsSmooth : Prop

structure VectorBundleEvidence (V : VectorBundlePackage) where
  localTrivializationClosed : V.localTrivialization
  smoothStructureClosed : V.smoothStructure
  vectorSpaceStructureClosed : V.vectorSpaceStructure
  transitionFunctionsSmoothClosed : V.transitionFunctionsSmooth

def VectorBundleClosed (V : VectorBundlePackage) : Prop :=
  V.localTrivialization ∧ V.smoothStructure ∧ V.vectorSpaceStructure ∧ V.transitionFunctionsSmooth

theorem vector_bundle_closed_from_evidence (V : VectorBundlePackage) (E : VectorBundleEvidence V) :
    VectorBundleClosed V := by
  exact And.intro E.localTrivializationClosed (And.intro E.smoothStructureClosed (And.intro E.vectorSpaceStructureClosed E.transitionFunctionsSmoothClosed))

structure TensorBundlePackage (V : VectorBundlePackage) where
  tensorRank : ℕ × ℕ
  tensorProduct : Type w
  covariantDerivative : Prop
  curvatureTensor : Prop
  ricciScalar : Prop
  tensorFieldsSmooth : Prop
  leviCivitaConnection : Prop
  riemannCurvature : Prop

structure TensorBundleEvidence (V : VectorBundlePackage) (T : TensorBundlePackage V) where
  tensorFieldsSmoothClosed : T.tensorFieldsSmooth
  leviCivitaConnectionClosed : T.leviCivitaConnection
  riemannCurvatureClosed : T.riemannCurvature

def TensorBundleClosed (V : VectorBundlePackage) (T : TensorBundlePackage V) : Prop :=
  T.tensorFieldsSmooth ∧ T.leviCivitaConnection ∧ T.riemannCurvature

theorem tensor_bundle_closed_from_evidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (E : TensorBundleEvidence V T) :
    TensorBundleClosed V T := by
  exact And.intro E.tensorFieldsSmoothClosed (And.intro E.leviCivitaConnectionClosed E.riemannCurvatureClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse