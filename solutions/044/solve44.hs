-- https://projecteuler.net/problem=44
-- Run with: 'ghc solve44.hs && ./solve44' or 'runhaskell solve44.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:
	1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is not pentagonal.
Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk − Pj| is minimised;
what is the value of D?
-}

pentagonalNumbers :: [Double]
pentagonalNumbers = map pentagonalFormula [1..]
    where pentagonalFormula n = (n * ((3*n)-1)) / 2

isPentagonal :: (RealFrac a, Floating a) => a -> Bool
isPentagonal x = isInt $ pentagonalIndex x
    where pentagonalIndex y = (1/6)*((sqrt ((24*y) + 1)) + 1)
          -- ^^ I reversed the pentagonal number formula
          isInt x = x == fromInteger (round x)

candidates :: [Double]
candidates = [abs (x-y) | x <- (take w pentagonalNumbers), y <- (take w pentagonalNumbers), valid x y]
    where valid x y = isPentagonal (x+y) && isPentagonal (x-y)
          w = 2200 -- I'm not sure how to design this without a limit

main :: IO ()
main = print $ round $ head candidates
-- -> 5482660
-- (I would recommend compiling this one)
