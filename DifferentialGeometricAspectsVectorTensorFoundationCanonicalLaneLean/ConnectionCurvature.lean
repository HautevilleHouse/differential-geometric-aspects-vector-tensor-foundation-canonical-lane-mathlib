import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.VectorTensorFoundation

/-!
# Connection and Curvature Package
-/

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure ConnectionPackage (V : VectorBundlePackage) (T : TensorBundlePackage V) where
  covariantDerivativeExists : Prop
  torsionFree : Prop
  metricCompatible : Prop
  parallelTransport : Prop
  curvatureTensorDefined : Prop
  ricciTensorDefined : Prop
  scalarCurvatureDefined : Prop
  einsteinTensorDefined : Prop
  bianchiIdentities : Prop

structure ConnectionEvidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) where
  covariantDerivativeExistsClosed : C.covariantDerivativeExists
  torsionFreeClosed : C.torsionFree
  metricCompatibleClosed : C.metricCompatible
  bianchiIdentitiesClosed : C.bianchiIdentities

def ConnectionClosed (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) : Prop :=
  C.covariantDerivativeExists ∧ C.torsionFree ∧ C.metricCompatible ∧ C.bianchiIdentities

theorem connection_closed_from_evidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (E : ConnectionEvidence V T C) :
    ConnectionClosed V T C := by
  exact And.intro E.covariantDerivativeExistsClosed (And.intro E.torsionFreeClosed (And.intro E.metricCompatibleClosed E.bianchiIdentitiesClosed))

structure CurvaturePackage (V : VectorBundlePackage) (T : TensorBundlePackage V) where
  riemannTensorType : Type u
  ricciTensorType : Type u
  scalarCurvatureType : Type u
  einsteinTensorType : Type u
  sectionalCurvature : Prop
  holonomyGroup : Prop
  curvatureDecomposition : Prop
  weylTensor : Prop
  vanishingConditions : Prop

structure CurvatureEvidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (R : CurvaturePackage V T) where
  sectionalCurvatureClosed : R.sectionalCurvature
  holonomyGroupClosed : R.holonomyGroup
  curvatureDecompositionClosed : R.curvatureDecomposition
  weylTensorClosed : R.weylTensor
  vanishingConditionsClosed : R.vanishingConditions

def CurvatureClosed (V : VectorBundlePackage) (T : TensorBundlePackage V) (R : CurvaturePackage V T) : Prop :=
  R.sectionalCurvature ∧ R.holonomyGroup ∧ R.curvatureDecomposition ∧ R.weylTensor ∧ R.vanishingConditions

theorem curvature_closed_from_evidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (R : CurvaturePackage V T) (E : CurvatureEvidence V T R) :
    CurvatureClosed V T R := by
  exact And.intro E.sectionalCurvatureClosed (And.intro E.holonomyGroupClosed (And.intro E.curvatureDecompositionClosed (And.intro E.weylTensorClosed E.vanishingConditionsClosed)))

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse