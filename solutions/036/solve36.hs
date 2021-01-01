-- https://projecteuler.net/problem=36
-- Run with: 'ghc solve36.hs && ./solve36' or 'runhaskell solve36.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
(Please note that the palindromic number, in either base, may not include leading zeros.)
-}

import Numeric (showHex, showIntAtBase)
import Data.Char (intToDigit)

join :: [Integer] -> Integer
join = foldl addDigit 0
    where addDigit num d = 10 * num + d

rev :: Integer -> Integer
rev x = join $ reverse $ digits x

-- From solutions/030/solve30.hs
digits :: Integer -> [Integer]
digits = map (read . (:[])) . show

isPalindromic :: Integer -> Bool
isPalindromic x = x == rev x

isBinaryPalindromic :: Integer -> Bool
isBinaryPalindromic x = i == rev i
    where i = read (showIntAtBase 2 intToDigit x "")

isValid :: Integer -> Bool
isValid x = isPalindromic x && isBinaryPalindromic x

valid :: [Integer]
valid = [x | x <- [1..1000000], isValid x]

main = print (sum valid)
-- -> 872187
