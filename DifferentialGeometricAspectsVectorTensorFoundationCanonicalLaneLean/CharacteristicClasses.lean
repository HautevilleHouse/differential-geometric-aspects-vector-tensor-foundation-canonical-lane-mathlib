import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure CharacteristicClassesPackage (M : Type u) [TopologicalSpace M] where
  chernClasses : Prop
  pontryaginClasses : Prop
  eulerClass : Prop
  stiefelWhitneyClasses : Prop
  chernWeilTheory : Prop
  indexTheoremStatement : Prop

structure CharacteristicClassesEvidence {M : Type u} [TopologicalSpace M]
    (C : CharacteristicClassesPackage M) where
  chernClassesClosed : C.chernClasses
  pontryaginClassesClosed : C.pontryaginClasses
  eulerClassClosed : C.eulerClass
  stiefelWhitneyClassesClosed : C.stiefelWhitneyClasses
  chernWeilTheoryClosed : C.chernWeilTheory
  indexTheoremStatementClosed : C.indexTheoremStatement

def CharacteristicClassesClosed {M : Type u} [TopologicalSpace M]
    (C : CharacteristicClassesPackage M) : Prop :=
  C.chernClasses ∧ C.pontryaginClasses ∧ C.eulerClass ∧
  C.stiefelWhitneyClasses ∧ C.chernWeilTheory ∧ C.indexTheoremStatement

theorem characteristic_classes_closed_from_evidence
    {M : Type u} [TopologicalSpace M] (C : CharacteristicClassesPackage M)
    (E : CharacteristicClassesEvidence C) : CharacteristicClassesClosed C := by
  exact And.intro E.chernClassesClosed
    (And.intro E.pontryaginClassesClosed
      (And.intro E.eulerClassClosed
        (And.intro E.stiefelWhitneyClassesClosed
          (And.intro E.chernWeilTheoryClosed E.indexTheoremStatementClosed))))

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse