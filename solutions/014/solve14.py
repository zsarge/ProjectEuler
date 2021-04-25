# https://projecteuler.net/problem=14
# Run with: 'python solve14.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# The following iterative sequence is defined for the set of positive integers:
#   n → n/2 (n is even)
#   n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
#   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

# numba is only used to improve performance.
# remove lines 20 and 22 if you don't want it.
from numba import njit

@njit
def collatz_sequence(n: int, length: int) -> int:
    length += 1
    if n == 1:
        return length
    elif n % 2 == 0:
        return collatz_sequence(n / 2, length)
    else:
        return collatz_sequence((3*n)+1, length)

max_num: int = 0
max_size: int = 0

GOAL: int = 1_000_000
# divide by 1.5 to limit the range we check
for i in range(round(GOAL // 1.5), GOAL + 1):
    size = collatz_sequence(i, 0)
    if size > max_size:
        max_size = size
        max_num = i

print(max_num)
# -> 837799 
