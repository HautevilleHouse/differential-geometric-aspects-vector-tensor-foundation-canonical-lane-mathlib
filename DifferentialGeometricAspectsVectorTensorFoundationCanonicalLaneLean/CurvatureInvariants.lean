import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure RiemannianManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  metric : Type v
  riemannCurvatureTensor : Type w
  ricciTensor : Type x
  scalarCurvature : Type y
  smoothMetric : Prop
  metricPositiveDefinite : Prop
  leviCivitaConnection : Prop
  riemannTensorSymmetries : Prop
  ricciTensorContracted : Prop
  scalarCurvatureTraced : Prop
  smoothMetricTerm : smoothMetric
  metricPositiveDefiniteTerm : metricPositiveDefinite
  leviCivitaConnectionTerm : leviCivitaConnection
  riemannTensorSymmetriesTerm : riemannTensorSymmetries
  ricciTensorContractedTerm : ricciTensorContracted
  scalarCurvatureTracedTerm : scalarCurvatureTraced

structure RiemannianManifoldEvidence (M : RiemannianManifoldPackage) where
  smoothMetricClosed : M.smoothMetric
  metricPositiveDefiniteClosed : M.metricPositiveDefinite
  leviCivitaConnectionClosed : M.leviCivitaConnection
  riemannTensorSymmetriesClosed : M.riemannTensorSymmetries
  ricciTensorContractedClosed : M.ricciTensorContracted
  scalarCurvatureTracedClosed : M.scalarCurvatureTraced

def RiemannianManifoldClosed (M : RiemannianManifoldPackage) : Prop :=
  M.smoothMetric ∧ M.metricPositiveDefinite ∧ M.leviCivitaConnection ∧
  M.riemannTensorSymmetries ∧ M.ricciTensorContracted ∧ M.scalarCurvatureTraced

theorem riemannian_manifold_closed_from_evidence (M : RiemannianManifoldPackage)
    (E : RiemannianManifoldEvidence M) : RiemannianManifoldClosed M := by
  exact And.intro E.smoothMetricClosed
    (And.intro E.metricPositiveDefiniteClosed
      (And.intro E.leviCivitaConnectionClosed
        (And.intro E.riemannTensorSymmetriesClosed
          (And.intro E.ricciTensorContractedClosed E.scalarCurvatureTracedClosed))))

structure CurvatureInvariantsPackage where
  sectionalCurvatureFormula : Prop
  ricciCurvatureSymmetric : Prop
  scalarCurvatureFunction : Prop
  curvatureOperator : Prop
  einsteinTensor : Prop
  weylTensor : Prop
  sectionalCurvatureFormulaTerm : sectionalCurvatureFormula
  ricciCurvatureSymmetricTerm : ricciCurvatureSymmetric
  scalarCurvatureFunctionTerm : scalarCurvatureFunction
  curvatureOperatorTerm : curvatureOperator
  einsteinTensorTerm : einsteinTensor
  weylTensorTerm : weylTensor

structure CurvatureInvariantsEvidence (I : CurvatureInvariantsPackage) where
  sectionalCurvatureFormulaClosed : I.sectionalCurvatureFormula
  ricciCurvatureSymmetricClosed : I.ricciCurvatureSymmetric
  scalarCurvatureFunctionClosed : I.scalarCurvatureFunction
  curvatureOperatorClosed : I.curvatureOperator
  einsteinTensorClosed : I.einsteinTensor
  weylTensorClosed : I.weylTensor

def CurvatureInvariantsClosed (I : CurvatureInvariantsPackage) : Prop :=
  I.sectionalCurvatureFormula ∧ I.ricciCurvatureSymmetric ∧ I.scalarCurvatureFunction ∧
  I.curvatureOperator ∧ I.einsteinTensor ∧ I.weylTensor

theorem curvature_invariants_closed_from_evidence (I : CurvatureInvariantsPackage)
    (E : CurvatureInvariantsEvidence I) : CurvatureInvariantsClosed I := by
  exact And.intro E.sectionalCurvatureFormulaClosed
    (And.intro E.ricciCurvatureSymmetricClosed
      (And.intro E.scalarCurvatureFunctionClosed
        (And.intro E.curvatureOperatorClosed
          (And.intro E.einsteinTensorClosed E.weylTensorClosed))))

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse