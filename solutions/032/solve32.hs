-- https://projecteuler.net/problem=32
-- Run with: 'ghc solve32.hs && ./solve32' or 'runhaskell solve32.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;

for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
-}

import Data.List

pandigital n = permutations [1..n]
example = [3,9,1,8,6,7,2,5,4]

-- https://stackoverflow.com/a/1918515
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d

-- https://wiki.haskell.org/99_questions/Solutions/18
slice xs i k | i>0 = take (k-i+1) $ drop (i-1) xs

-- Maximum bounds:
---- splits list = [split list x y | x <- [1..(length list) - 1], y <- [1..(length list) - 1], x < y] 
-- However, by limiting the bounds we split at, we save time and computation:
splits :: [Integer] -> [[Integer]]
splits list = [split list x y | x <- [3..(length list) - 5], y <- [4..(length list) - 4], x < y]
    where split n i j = [front, middle, end]
           where front = fromDigits $ take i n
                 middle = fromDigits $ slice n (i+1) j
                 end = fromDigits $ drop j n

validPandigitalProducts :: Integer -> [Integer]
validPandigitalProducts n = 
    let extractAllFrom xs = map extractProduct xs
        combos = map splits (pandigital n)
     in filter (\x -> x /= 0) (extractAllFrom combos)
    where
        extractProduct :: [[Integer]] -> Integer
        extractProduct xs = 
            let products = (filter valid xs) 
             in if length products >= 1 then
                     product (head products)
                else 0
          where valid (front:middle:end:_) = front * middle == end
                product (_:_:end:_) = end

main = print $ sum $ nub (validPandigitalProducts 9)
-- -> 45228
-- This takes around 13 seconds to compute.
