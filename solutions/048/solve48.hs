-- https://projecteuler.net/problem=48
-- Run with: 'ghc solve48.hs && ./solve48' or 'runhaskell solve48.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

-}

getLast n range = drop ((length range) - n) range
series = [x^x | x <- [1..1000]]
main = putStrLn (getLast 10 (show (sum series)))
-- -> 9110846700
