import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.CanonicalLaneMathlibCore

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DifferentialGeometricSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothAtlas : Type
  dimension : ℕ

default

structure DifferentialGeometricAdmittedObject where
  space : DifferentialGeometricSpace
  vectorBundle : Type
  tensorBundle : Type
  connection : Type
  curvatureTensor : Type
  torsionFree : Prop
  metricCompatible : Prop
  conclusion : torsionFree ∧ metricCompatible

def DifferentialGeometricWitnessClosed (O : DifferentialGeometricAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : DifferentialGeometricAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DifferentialGeometricWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse