import DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean.ConnectionCurvature

/-!
# Holonomy Package
-/

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure HolonomyPackage (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) where
  holonomyGroup : Type u
  holonomyAlgebra : Prop
  reducedHolonomy : Prop
  ambroseSingerTheorem : Prop
  curvatureSpan : Prop
  holonomyClassification : Prop
  restrictedHolonomy : Prop
  localHolonomy : Prop

structure HolonomyEvidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) where
  holonomyAlgebraClosed : H.holonomyAlgebra
  ambroseSingerTheoremClosed : H.ambroseSingerTheorem
  curvatureSpanClosed : H.curvatureSpan
  holonomyClassificationClosed : H.holonomyClassification
  localHolonomyClosed : H.localHolonomy

def HolonomyClosed (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) : Prop :=
  H.holonomyAlgebra ∧ H.ambroseSingerTheorem ∧ H.curvatureSpan ∧ H.holonomyClassification ∧ H.localHolonomy

theorem holonomy_closed_from_evidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) (E : HolonomyEvidence V T C R H) :
    HolonomyClosed V T C R H := by
  exact And.intro E.holonomyAlgebraClosed (And.intro E.ambroseSingerTheoremClosed (And.intro E.curvatureSpanClosed (And.intro E.holonomyClassificationClosed E.localHolonomyClosed)))

structure BergerClassificationPackage (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) where
  holonomyList : List String
  irreducibleSymmetricSpaces : Prop
  specialHolonomy : Prop
  classificationTheorem : Prop
  proofSteps : Prop

structure BergerClassificationEvidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) (B : BergerClassificationPackage V T C R H) where
  holonomyListClosed : B.holonomyList = ["SO(n)", "U(n)", "SU(n)", "Sp(n)", "Sp(n)Sp(1)", "G2", "Spin(7)"]
  irreducibleSymmetricSpacesClosed : B.irreducibleSymmetricSpaces
  specialHolonomyClosed : B.specialHolonomy
  classificationTheoremClosed : B.classificationTheorem
  proofStepsClosed : B.proofSteps

def BergerClassificationClosed (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) (B : BergerClassificationPackage V T C R H) : Prop :=
  (B.holonomyList = ["SO(n)", "U(n)", "SU(n)", "Sp(n)", "Sp(n)Sp(1)", "G2", "Spin(7)"]) ∧ B.irreducibleSymmetricSpaces ∧ B.specialHolonomy ∧ B.classificationTheorem ∧ B.proofSteps

theorem berger_classification_closed_from_evidence (V : VectorBundlePackage) (T : TensorBundlePackage V) (C : ConnectionPackage V T) (R : CurvaturePackage V T) (H : HolonomyPackage V T C R) (B : BergerClassificationPackage V T C R H) (E : BergerClassificationEvidence V T C R H B) :
    BergerClassificationClosed V T C R H B := by
  exact And.intro E.holonomyListClosed (And.intro E.irreducibleSymmetricSpacesClosed (And.intro E.specialHolonomyClosed (And.intro E.classificationTheoremClosed E.proofStepsClosed)))

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse