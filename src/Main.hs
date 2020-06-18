{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import System.IO (readFile, writeFile)

main = do
    putStrLn "Starting Server..."
    scotty 3000 $ do
        get "/value" $ do
            let i = incrementFile
            text "Ok"



numFromFile :: IO String
numFromFile = do
    content <- readFile "num"
    return (content)

incrementFile = do
    val <- numFromFile
    let num = succ $ read val :: Integer
    let str = show $ num :: String
    putStrLn str
    writeFile "num" str
    return ()
