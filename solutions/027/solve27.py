# https://projecteuler.net/problem=27
# Run with: 'python solve27.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# Euler discovered the remarkable quadratic formula:
# n^2 + n + 41
# It turns out that the formula will produce 40 primes
# for the consecutive integer values 0 <= n <= 39.
# However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
# and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
# The incredible formula n^2 - 79n + 1601 was discovered,
# which produces 80 primes for the consecutive values 0 <= n <= 79. 
# The product of the coefficients, −79 and 1601, is −126479.
# Considering quadratics of the form:
#    n^2 + an + b, where |a| < 1000 and |b| <= 1000
#    where |n| is the modulus/absolute value of n
#       e.g. |11| = 11 and |-4| = 4
# 
# Find the product of the coefficients, a and b, 
# for the quadratic expression that produces the maximum number of 
# primes for consecutive values of n, starting with n = 0.

import math

def quadratic(n: int, a: int, b: int) -> int:
    return n**2 + a*n + b

# O(sqrt(n))
def is_prime(num: int) -> bool:
    num = abs(num)
    # return early if even
    if num % 2 == 0:
        return False
    limit = int(math.sqrt(num))
    for i in range(3, limit + 1):
        if num % i == 0:
            return False
        if num % i**2 == 0:
            return False
    return True

def number_of_primes(a: int, b: int) -> int:
    i = 0
    quad = quadratic(i, a, b)
    while is_prime(quad):
        i += 1
        quad = quadratic(i, a, b)
    return i

LIMIT = 1_000
highest = 0
A = 0
B = 0

# I chose an arbitrary limit of -100
# as the lower bound. Theoretically,
# this should go to -∞
for a in range(-100, LIMIT):
    for b in range(-100, LIMIT + 1):
        num = number_of_primes(a,b)
        highest = max(highest, num)
        if num == highest:
            A = a
            B = b

print(A*B)
# -> -59231 (takes ~4 seconds)

