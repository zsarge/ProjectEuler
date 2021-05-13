-- https://projecteuler.net/problem=42
-- Run with: 'ghc solve42.hs && ./solve42' or 'runhaskell solve42.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1);
so the first ten triangle numbers are:
    1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
By converting each letter in a word to a number corresponding to its
alphabetical position and adding these values we form a word value.
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
If the word value is a triangle number then we shall call the word a triangle word.
Using p042_words.txt, a 16K text file containing nearly two-thousand
common English words, how many are triangle words?
-}

import System.IO
import Data.List

contentsToList :: String -> [String]
contentsToList xs = read ("[" ++ (xs ++ "]")) :: [String]

triangleNumber :: (RealFrac a, Integral b) => a -> b
triangleNumber n = round (0.5 * n * (n + 1))

triangleNumbers :: [Int]
triangleNumbers = [triangleNumber x | x <- [1..]]

letterValue :: Char -> Int
letterValue char = (elemIndices char ['A'..'Z']) !! 0 + 1

wordValue :: String -> Int
wordValue word = sum $ map letterValue word

isTriangleNumber :: Int -> Bool
isTriangleNumber x = check x 0
    where check x i
            | x == triangleNumbers !! i = True
            | x <  triangleNumbers !! i = False
            | otherwise = check x (i + 1)

isTriangleWord :: String -> Bool
isTriangleWord word = isTriangleNumber (wordValue word)

triangleWords :: [String] -> [String]
triangleWords words = [word | word <- words, isTriangleWord word]

main = do
    contents <- readFile "p042_words.txt"
    let words = (contentsToList contents)
    print (length (triangleWords words))
-- -> 162
