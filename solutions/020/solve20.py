# https://projecteuler.net/problem=20
# Run with: 'python solve20.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!

from math import factorial

print(sum(map(int, list(str(factorial(100))))))
# -> 648
