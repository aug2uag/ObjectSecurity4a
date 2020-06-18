module Main where

import System.IO (readFile, writeFile)

numFromFile :: IO String
numFromFile = do
    content <- readFile "num"
    return (content)

main = do
    putStrLn "hello"
    val <- numFromFile
    let num = succ $ read val :: Integer
    let str = show $ num :: String
    putStrLn str
    writeFile "num" str
    return ()
