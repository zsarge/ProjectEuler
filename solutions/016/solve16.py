# https://projecteuler.net/problem=16
# Run with: 'python solve16.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 21000?

def digits(power):
    return sum(map(int, list(str(2**power))))

print(digits(1_000))
# -> 1366
