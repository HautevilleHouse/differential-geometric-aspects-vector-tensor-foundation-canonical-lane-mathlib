import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure ConnectionPackage (M : Type u) [TopologicalSpace M] where
  tangentBundle : Type v
  connectionForm : Type w
  curvatureForm : Type x
  torsionForm : Type y
  metricCompatibility : Prop
  leviCivitaUniqueness : Prop

structure ConnectionEvidence {M : Type u} [TopologicalSpace M]
    (C : ConnectionPackage M) where
  metricCompatibilityClosed : C.metricCompatibility
  leviCivitaUniquenessClosed : C.leviCivitaUniqueness

def ConnectionClosed {M : Type u} [TopologicalSpace M]
    (C : ConnectionPackage M) : Prop :=
  C.metricCompatibility ∧ C.leviCivitaUniqueness

theorem connection_closed_from_evidence
    {M : Type u} [TopologicalSpace M] (C : ConnectionPackage M)
    (E : ConnectionEvidence C) : ConnectionClosed C := by
  exact And.intro E.metricCompatibilityClosed E.leviCivitaUniquenessClosed

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse