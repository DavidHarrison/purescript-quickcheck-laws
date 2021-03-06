module Test.QuickCheck.Laws.Control.Bind where

import Control.Monad.Eff.Console (log)
import Test.QuickCheck (QC(..), quickCheck)
import Test.QuickCheck.Arbitrary (Arbitrary, Coarbitrary)
import Type.Proxy (Proxy(), Proxy2())

import Prelude

-- | - Associativity: `(x >>= f) >>= g = x >>= (\k => f k >>= g)`
checkBind :: forall m a eff. (Bind m,
                              Arbitrary a,
                              Arbitrary (m a),
                              Coarbitrary a,
                              Eq (m a)) => Proxy2 m
                                        -> Proxy a
                                        -> QC eff Unit
checkBind _ _ = do

  log "Checking 'Associativity' law for Bind"
  quickCheck associativity

  where

  associativity :: m a -> (a -> m a) -> (a -> m a) -> Boolean
  associativity m f g = ((m >>= f) >>= g) == (m >>= (\x -> f x >>= g))
