module Test.Data.Unit where

import Test.QuickCheck
import Test.QuickCheck.Laws.Data.Bounded
import Test.QuickCheck.Laws.Data.BoundedLattice
import Test.QuickCheck.Laws.Data.ComplementedLattice
import Test.QuickCheck.Laws.Data.DistributiveLattice
import Test.QuickCheck.Laws.Data.DivisionRing
import Test.QuickCheck.Laws.Data.Eq
import Test.QuickCheck.Laws.Data.Lattice
import Test.QuickCheck.Laws.Data.ModuloSemiring
import Test.QuickCheck.Laws.Data.Num
import Test.QuickCheck.Laws.Data.Ord
import Test.QuickCheck.Laws.Data.Ring
import Test.QuickCheck.Laws.Data.Semigroup
import Test.QuickCheck.Laws.Data.Semiring
import Type.Proxy (Proxy(..))

prxUnit :: Proxy Unit
prxUnit = Proxy

checkUnit = do
  checkEq prxUnit
  checkOrd prxUnit
  checkBounded prxUnit
  checkLattice prxUnit
  checkBoundedLattice prxUnit
  checkComplementedLattice prxUnit
  checkDistributiveLattice prxUnit
  checkSemigroup prxUnit
  checkSemiring prxUnit
  checkModuloSemiring prxUnit
  checkRing prxUnit
  checkDivisionRing prxUnit
  checkNum prxUnit
