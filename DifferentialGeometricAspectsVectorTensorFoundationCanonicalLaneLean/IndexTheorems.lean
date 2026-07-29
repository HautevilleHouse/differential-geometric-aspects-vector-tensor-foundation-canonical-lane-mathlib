import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure VectorBundlePackage where
  baseSpace : Type u
  totalSpace : Type v
  projectionMap : Type w
  fiberType : Type x
  smoothBundle : Prop
  localTrivializations : Prop
  connectionOnBundle : Prop
  curvatureOnBundle : Prop
  smoothBundleTerm : smoothBundle
  localTrivializationsTerm : localTrivializations
  connectionOnBundleTerm : connectionOnBundle
  curvatureOnBundleTerm : curvatureOnBundle

structure VectorBundleEvidence (B : VectorBundlePackage) where
  smoothBundleClosed : B.smoothBundle
  localTrivializationsClosed : B.localTrivializations
  connectionOnBundleClosed : B.connectionOnBundle
  curvatureOnBundleClosed : B.curvatureOnBundle

def VectorBundleClosed (B : VectorBundlePackage) : Prop :=
  B.smoothBundle ∧ B.localTrivializations ∧ B.connectionOnBundle ∧ B.curvatureOnBundle

theorem vector_bundle_closed_from_evidence (B : VectorBundlePackage)
    (E : VectorBundleEvidence B) : VectorBundleClosed B := by
  exact And.intro E.smoothBundleClosed
    (And.intro E.localTrivializationsClosed
      (And.intro E.connectionOnBundleClosed E.curvatureOnBundleClosed))

structure DiracOperatorPackage (B : VectorBundlePackage) where
  cliffordModule : Type u
  diracOperator : Type v
  laplacianRelation : Prop
  weitzenböckFormula : Prop
  indexFormula : Prop
  cliffordModuleTerm : cliffordModule
  diracOperatorTerm : diracOperator
  laplacianRelationTerm : laplacianRelation
  weitzenböckFormulaTerm : weitzenböckFormula
  indexFormulaTerm : indexFormula

structure DiracOperatorEvidence {B : VectorBundlePackage} (D : DiracOperatorPackage B) where
  cliffordModuleClosed : D.cliffordModule
  diracOperatorClosed : D.diracOperator
  laplacianRelationClosed : D.laplacianRelation
  weitzenböckFormulaClosed : D.weitzenböckFormula
  indexFormulaClosed : D.indexFormula

def DiracOperatorClosed {B : VectorBundlePackage} (D : DiracOperatorPackage B) : Prop :=
  D.cliffordModule ∧ D.diracOperator ∧ D.laplacianRelation ∧ D.weitzenböckFormula ∧ D.indexFormula

theorem dirac_operator_closed_from_evidence {B : VectorBundlePackage}
    (D : DiracOperatorPackage B) (E : DiracOperatorEvidence D) : DiracOperatorClosed D := by
  exact And.intro E.cliffordModuleClosed
    (And.intro E.diracOperatorClosed
      (And.intro E.laplacianRelationClosed
        (And.intro E.weitzenböckFormulaClosed E.indexFormulaClosed)))

structure IndexTheoremPackage (D : DiracOperatorPackage) where
  analyticalIndex : Type u
  topologicalIndex : Type v
  indexEquality : Prop
  kernelCokernelData : Prop
  indexEqualityTerm : indexEquality
  kernelCokernelDataTerm : kernelCokernelData

structure IndexTheoremEvidence {D : DiracOperatorPackage} (I : IndexTheoremPackage D) where
  indexEqualityClosed : I.indexEquality
  kernelCokernelDataClosed : I.kernelCokernelData

def IndexTheoremClosed {D : DiracOperatorPackage} (I : IndexTheoremPackage D) : Prop :=
  I.indexEquality ∧ I.kernelCokernelData

theorem index_theorem_closed_from_evidence {D : DiracOperatorPackage}
    (I : IndexTheoremPackage D) (E : IndexTheoremEvidence I) : IndexTheoremClosed I := by
  exact And.intro E.indexEqualityClosed E.kernelCokernelDataClosed

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse