import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure ConnectionPackage (M : Type u) [SmoothManifold M] where
  bundle : VectorBundlePackage M
  covariantDerivative : Type
  parallelTransport : Prop
  curvatureForm : Prop
  torsionFree : Prop

structure ConnectionEvidence (C : ConnectionPackage M) where
  covariantDerivativeLinear : Prop
  parallelTransportDefined : C.parallelTransport
  curvatureFormClosed : C.curvatureForm
  torsionFreeClosed : C.torsionFree

def ConnectionClosed (C : ConnectionPackage M) : Prop :=
  C.parallelTransport ∧ C.curvatureForm ∧ C.torsionFree

theorem connection_closed_from_evidence (C : ConnectionPackage M) (E : ConnectionEvidence C) :
    ConnectionClosed C := by
  exact And.intro E.parallelTransportDefined (And.intro E.curvatureFormClosed E.torsionFreeClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse