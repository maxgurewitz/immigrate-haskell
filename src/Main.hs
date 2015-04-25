{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty 
import Data.Aeson (object)
import Data.Aeson.Types

main = scotty 3000 $ do
  get "/" $ do
    json $ object ["foo" .= ("bar" :: String)]
