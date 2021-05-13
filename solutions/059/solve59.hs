-- https://projecteuler.net/problem=59
-- Run with: 'ghc solve59.hs && ./solve59' or 'runhaskell solve59.hs'
-- using Haskell with GHC 8.0.2
-- by Zack Sargent

{- Prompt:

Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.
Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
Your task has been made easy, as the encryption key consists of three lower case characters. Using p059_cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.

-}

{- This solution works by brute forcing
   every possible decoding string.  -}

import Data.Bits
import Data.List
import Data.Char (ord)

parseCipher :: String -> [Int]
parseCipher xs = read ("[" ++ (xs ++ "]")) :: [Int]

char :: Int -> Char
char i = toEnum i :: Char

solveChar :: Int -> Char -> Char
solveChar c k = char (c `xor` (ord k))

solveString :: [Int] -> String -> String
solveString message key = [solveChar x y | (x,y) <- zip message (cycle key)]

isValid :: String -> Bool
isValid str = all valid (map ord str)
    where valid n = (n < 123) && (n >= 32) && n /= 35 && n /= 33
      --                '{'           ' '         '#'        '!'

alpha = ['a'..'z']
possiblePasswords = [a : b : c : [] | a <- alpha, b <- alpha, c <- alpha]

breakCipher :: [Int] -> String
breakCipher cipherText =
    let solution = break cipherText 0 []
     in if length solution /= 1
           then error "Solution not found"
           -- If the solution is not found, 
           -- isValid needs to be adjusted to limit more possibilities.
        else solution !! 0
            where break cipherText index acc
                    | index >= length possiblePasswords = acc
                    | isValid broken = break cipherText (index + 1) (broken : acc)
                    | otherwise = break cipherText (index + 1) acc
                    where key = possiblePasswords !! index
                          broken = solveString cipherText key

main :: IO ()
main = do
    rawCipher <- readFile "p059_cipher.txt"
    let cipher = parseCipher rawCipher
    let solution = breakCipher cipher
    print $ sum (map ord solution)
    -- -> 129448
