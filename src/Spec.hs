module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de horrocruxes" $ do
    it "Se destruyen todos los horrocruxes" $ do
      finalFeliz caso2 `shouldBe` True
      finalFeliz caso3 `shouldBe` True
      finalFeliz casoInfinito `shouldBe` True
    it "No se destruyen todos los horrocruxes" $ do
      finalFeliz caso1 `shouldBe` False

