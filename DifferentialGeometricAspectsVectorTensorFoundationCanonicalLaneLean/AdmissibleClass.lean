import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlib

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

open HautevilleHouse.canonicalLaneMathlib

structure DifferentialGeometricSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothAtlas : Type
  connection : Type
  curvature : Type

structure DifferentialGeometricAdmittedObject where
  space : DifferentialGeometricSpace
  smoothClosedConnection : Prop
  curvatureInvariantSatisfied : Prop
  vectorTensorStructureDefined : Prop
  conclusion : curvatureInvariantSatisfied ∧ vectorTensorStructureDefined

structure AdmissibleClass where
  object : DifferentialGeometricAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DifferentialGeometricWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse