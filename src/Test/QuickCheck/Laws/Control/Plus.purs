module Test.QuickCheck.Laws.Control.Plus where

import Control.Monad.Eff.Console (log)
import Control.Alt ((<|>))
import Control.Plus (Plus, empty)
import Test.QuickCheck (QC(..), quickCheck)
import Test.QuickCheck.Arbitrary (Arbitrary, Coarbitrary)
import Type.Proxy (Proxy(), Proxy2())

import Prelude

-- | - Left identity: `empty <|> x == x`
-- | - Right identity: `x <|> empty == x`
-- | - Annihilation: `f <$> empty == empty`
checkPlus :: forall f a b eff. (Plus f,
                                Arbitrary a,
                                Arbitrary b,
                                Arbitrary (f a),
                                Coarbitrary a,
                                Eq (f a),
                                Eq (f b)) => Proxy2 f
                                          -> Proxy a
                                          -> Proxy b
                                          -> QC eff Unit
checkPlus _ _ _ = do

  log "Checking 'Left identity' law for Plus"
  quickCheck leftIdentity

  log "Checking 'Right identity' law for Plus"
  quickCheck rightIdentity

  log "Checking 'Annihilation' law for Plus"
  quickCheck annihilation

  where

  leftIdentity :: f a -> Boolean
  leftIdentity x = (empty <|> x) == x

  rightIdentity :: f a -> Boolean
  rightIdentity x = (x <|> empty) == x

  annihilation :: (a -> b) -> Boolean
  annihilation f = f <$> empty == empty :: f b
