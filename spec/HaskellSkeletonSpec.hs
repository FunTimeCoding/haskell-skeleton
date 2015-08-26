module HaskellSkeletonSpec (main, spec) where

import Test.Hspec
import HaskellSkeleton

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "getHelloString" $ do
    it "returns a string" $ do
      getHelloString `shouldBe` "Hello Friend."
    it "returns a number" $ do
      getNumberOne `shouldBe` 1
