-- https://projecteuler.net/problem=39
-- Run with: 'ghc solve39.hs && ./solve39' or 'runhaskell solve39.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?

-}

perimeter a b = a + b + c
	where c = (sqrt ((a*a) + (b*b)))

main = print $ perimeter 3 4
