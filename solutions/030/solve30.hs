-- https://projecteuler.net/problem=30
-- Run with: 'ghc solve30.hs && ./solve30' or 'runhaskell solve30.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
    1634 = 1^4 + 6^4 + 3^4 + 4^4
    8208 = 8^4 + 2^4 + 0^4 + 8^4
    9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 14 is not a sum it is not included.
The sum of these numbers is 1634 + 8208 + 9474 = 19316.
Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
-}

digits :: Int -> [Int]
digits = map (read . (:[])) . show

sumDigitsToPower :: Int -> Int -> Int
sumDigitsToPower x power = sum [y^power | y <- digits x]

validNumbersToPower :: Int -> [Int]
-- 200,000 is an arbitrary limit to stop checking at
validNumbersToPower power = [x | x <- [2..200000], x == sumDigitsToPower x power]

main = print (sum (validNumbersToPower 5))
-- -> 443839 (takes ~2 seconds)
