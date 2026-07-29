import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.ConnectionCurvature

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure TensorInvariantsPackage {O : DifferentialGeometricAdmittedObject} where
  ricciTensor : Type
  scalarCurvature : Type
  einsteinTensor : Type
  weylTensor : Type
  ricciDecomposition : Prop
  einsteinEquation : Prop

default

structure TensorInvariantsEvidence {O : DifferentialGeometricAdmittedObject} (T : TensorInvariantsPackage O) where
  ricciDecompositionClosed : T.ricciDecomposition
  einsteinEquationClosed : T.einsteinEquation

def TensorInvariantsClosed {O : DifferentialGeometricAdmittedObject} (T : TensorInvariantsPackage O) : Prop :=
  T.ricciDecomposition ∧ T.einsteinEquation

theorem tensor_invariants_closed_from_evidence {O : DifferentialGeometricAdmittedObject} (T : TensorInvariantsPackage O) (E : TensorInvariantsEvidence T) :
    TensorInvariantsClosed T := by
  exact And.intro E.ricciDecompositionClosed E.einsteinEquationClosed

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse