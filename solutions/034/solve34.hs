-- https://projecteuler.net/problem=34
-- Run with: 'ghc solve34.hs && ./solve34' or 'runhaskell solve34.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
Find the sum of all numbers which are equal to the sum of the factorial of their digits.
Note: As 1! = 1 and 2! = 2 are not sums they are not included.
-}

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- From solutions/030/solve30.hs
digits :: Int -> [Int]
digits = map (read . (:[])) . show

factorialsOfDigits :: Int -> [Int]
factorialsOfDigits x = map factorial (digits x)

sumFactorialsOfDigits :: Int -> Int
sumFactorialsOfDigits 1 = 0
sumFactorialsOfDigits 2 = 0
sumFactorialsOfDigits x = sum (factorialsOfDigits x)

validNumbers :: [Int]
-- 50,000 is an arbitrary limit
validNumbers = [x | x <- [1..50000], x == sumFactorialsOfDigits x]

main = print (sum validNumbers)
-- -> 40730
