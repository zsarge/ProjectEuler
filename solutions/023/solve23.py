# https://projecteuler.net/problem=23
# Run with: 'python solve23.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# A perfect number is a number for which the sum of its proper divisors
# is exactly equal to the number. For example, the sum of the proper
# divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28,
# which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is
# less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
# smallest number that can be written as the sum of two abundant numbers
# is 24. By mathematical analysis, it can be shown that all integers
# greater than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis
# even though it is known that the greatest number that cannot be
# expressed as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written
# as the sum of two abundant numbers.

# This solution takes longer than I'd like it to.

import math

LIMIT = 28123

# O(sqrt(n))
def get_sum_of_divisors(num: int) -> int:
    if num is 1:
        return 1

    n = math.ceil(math.sqrt(num))
    total = 1
    for i in range(2, n):
        if num % i == 0:
            total += i
            total += num // i

    if n ** 2 == num:
        total += n

    return total

def is_abundant(num: int) -> bool:
    return num < get_sum_of_divisors(num)

abundant_nums = []
for i in range(1, LIMIT + 1):
    if is_abundant(i):
        abundant_nums.append(i)

# For all sums, mark the sums as valid
valid = [False]*(LIMIT + 1)
for i in range(0, len(abundant_nums)):
    for j in range(i, len(abundant_nums)):
        exists = abundant_nums[i] + abundant_nums[j]
        if exists <= LIMIT:
            valid[exists] = exists

total = 0
# get the numerical value of the numbers marked as valid
for x in range(1, len(valid)):
    if not valid[x]:
        total += x

print(total)
# -> 4179871
