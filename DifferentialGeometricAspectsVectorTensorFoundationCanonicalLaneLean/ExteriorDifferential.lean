import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure ExteriorDifferentialPackage where
  exteriorDerivative : Type u
  wedgeProduct : Type v
  poincareLemma : Prop
  closedExactRelation : Prop
  integrationStokes : Prop

structure ExteriorDifferentialEvidence (D : ExteriorDifferentialPackage) where
  poincareLemmaClosed : D.poincareLemma
  closedExactRelationClosed : D.closedExactRelation
  integrationStokesClosed : D.integrationStokes

def ExteriorDifferentialClosed (D : ExteriorDifferentialPackage) : Prop :=
  D.poincareLemma ∧ D.closedExactRelation ∧ D.integrationStokes

theorem exterior_differential_closed_from_evidence (D : ExteriorDifferentialPackage)
    (E : ExteriorDifferentialEvidence D) : ExteriorDifferentialClosed D := by
  exact And.intro E.poincareLemmaClosed (And.intro E.closedExactRelationClosed E.integrationStokesClosed)

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse