# https://projecteuler.net/problem=15
# Run with: 'python solve15.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# Starting in the top left corner of a 2×2 grid,
# and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
# 
# How many such routes are there through a 20×20 grid?

# Plan: From Wikipedia, https://en.wikipedia.org/wiki/Lattice_path
# The number of lattice paths from (0,0) to (n,k) is equal to the 
# binomial coefficient {n + x  n}

from math import factorial

def binomial_coefficient(n: int, k: int) -> float:
    return factorial(n) / (factorial(k) * factorial(n - k))

# assume top left is (0,0)
def lattice_distance(n: int, k: int) -> float:
    return binomial_coefficient(n + k, n)

print(lattice_distance(20,20))
