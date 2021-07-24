# https://projecteuler.net/problem=89
# Run with: 'python solve89.py'
# using Python 3.6.9
# by Zack Sargent

"""
Prompt:

# For a number written in Roman numerals to be considered valid there are basic rules which must be followed. Even though the rules allow some numbers to be expressed in more than one way there is always a "best" way of writing a particular number.
# For example, it would appear that there are at least six ways of writing the number sixteen:
# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI
# However, according to the rules only XIIIIII and XVI are valid, and the last example is considered to be the most efficient, as it uses the least number of numerals.
# The 11K text file, roman.txt (right click and 'Save Link/Target As...'), contains one thousand numbers written in valid, but not necessarily minimal, Roman numerals; see About... Roman Numerals for the definitive rules for this problem.
# Find the number of characters saved by writing each of these in their minimal form.
# Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.
"""

# While looking for ways to approach this problem, I found some code that did
# what I wanted really well, so I modified that to suit my needs. It's not a
# direct solution, so I consider it fair game.
# https://github.com/zopefoundation/roman/blob/09172a7762432e5cd825a4a88adc924d4da3d3a0/src/roman.py#L42-L109

from typing import List

def count_chars(arr: List[str]) -> int:
    return sum([len(s) for s in arr])

romanNumeralMap = (('M' , 1000),
                   ('CM',  900),
                   ('D' ,  500),
                   ('CD',  400),
                   ('C' ,  100),
                   ('XC',   90),
                   ('L' ,   50),
                   ('XL',   40),
                   ('X' ,   10),
                   ('IX',    9),
                   ('V' ,    5),
                   ('IV',    4),
                   ('I' ,    1))

def toRoman(n: int) -> str:
    result = ""
    for numeral, integer in romanNumeralMap:
        while n >= integer:
            result += numeral
            n -= integer
    return result

def fromRoman(s: str) -> int:
    result, index = 0, 0
    for numeral, integer in romanNumeralMap:
        while s[index:index + len(numeral)] == numeral:
            result += integer
            index += len(numeral)
    return result

def main():
    lines = []
    with open("p089_roman.txt") as file:
        lines = [line.strip() for line in file.readlines()]

    original = count_chars(lines)
    optimized = count_chars([toRoman(fromRoman(line)) for line in lines])

    print(original - optimized)
    # -> 743

if __name__ == "__main__":
    main()

