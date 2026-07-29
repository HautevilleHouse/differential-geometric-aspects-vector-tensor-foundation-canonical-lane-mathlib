import Mathlib

namespace HautevilleHouse
namespace DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean

structure AdditiveLane (X : Type) [Add X] [Sub X] where
  state : X
  delta : X
  projection : X → X
  xNext : X :=
    state + projection delta
  carriedComponent : X :=
    delta - projection delta

structure Projection (S : Type) where
  toFun : S → S
  idempotent : ∀ x : S, toFun (toFun x) = toFun x

end DifferentialGeometricAspectsVectorTensorFoundationCanonicalLaneLean
end HautevilleHouse