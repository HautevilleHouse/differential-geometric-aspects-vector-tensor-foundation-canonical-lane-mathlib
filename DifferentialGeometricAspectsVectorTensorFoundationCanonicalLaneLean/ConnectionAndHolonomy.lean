import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure ConnectionPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  vectorBundle : Type v
  connectionForm : Type w
  parallelTransport : Type x
  curvatureForm : Type y
  torsionForm : Type z
  connectionCompatibleWithMetric : Prop
  parallelTransportPreservesInnerProduct : Prop
  curvatureFromConnection : Prop
  torsionFromConnection : Prop
  smoothConnection : Prop
  smoothConnectionTerm : smoothConnection
  connectionCompatibleWithMetricTerm : connectionCompatibleWithMetric
  parallelTransportPreservesInnerProductTerm : parallelTransportPreservesInnerProduct
  curvatureFromConnectionTerm : curvatureFromConnection
  torsionFromConnectionTerm : torsionFromConnection

structure ConnectionEvidence (C : ConnectionPackage) where
  smoothConnectionClosed : C.smoothConnection
  connectionCompatibleWithMetricClosed : C.connectionCompatibleWithMetric
  parallelTransportPreservesInnerProductClosed : C.parallelTransportPreservesInnerProduct
  curvatureFromConnectionClosed : C.curvatureFromConnection
  torsionFromConnectionClosed : C.torsionFromConnection

def ConnectionClosed (C : ConnectionPackage) : Prop :=
  C.smoothConnection ∧ C.connectionCompatibleWithMetric ∧
  C.parallelTransportPreservesInnerProduct ∧ C.curvatureFromConnection ∧ C.torsionFromConnection

theorem connection_closed_from_evidence (C : ConnectionPackage) (E : ConnectionEvidence C) :
    ConnectionClosed C := by
  exact And.intro E.smoothConnectionClosed
    (And.intro E.connectionCompatibleWithMetricClosed
      (And.intro E.parallelTransportPreservesInnerProductClosed
        (And.intro E.curvatureFromConnectionClosed E.torsionFromConnectionClosed)))

structure HolonomyPackage (C : ConnectionPackage) where
  holonomyGroup : Type u
  holonomyRepresentation : Type v
  holonomyGroupLie : Prop
  holonomyInvariantSubbundle : Prop
  AmbroseSingerTheorem : Prop
  holonomyGroupLieTerm : holonomyGroupLie
  holonomyInvariantSubbundleTerm : holonomyInvariantSubbundle
  ambroseSingerTheoremTerm : AmbroseSingerTheorem

structure HolonomyEvidence {C : ConnectionPackage} (H : HolonomyPackage C) where
  holonomyGroupLieClosed : H.holonomyGroupLie
  holonomyInvariantSubbundleClosed : H.holonomyInvariantSubbundle
  ambroseSingerTheoremClosed : H.AmbroseSingerTheorem

def HolonomyClosed {C : ConnectionPackage} (H : HolonomyPackage C) : Prop :=
  H.holonomyGroupLie ∧ H.holonomyInvariantSubbundle ∧ H.AmbroseSingerTheorem

theorem holonomy_closed_from_evidence {C : ConnectionPackage} (H : HolonomyPackage C)
    (E : HolonomyEvidence H) : HolonomyClosed H := by
  exact And.intro E.holonomyGroupLieClosed
    (And.intro E.holonomyInvariantSubbundleClosed E.ambroseSingerTheoremClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse