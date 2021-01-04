# https://projecteuler.net/problem=21
# Run with: 'python solve21.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# Let d(n) be defined as the sum of proper divisors of n
#   (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an
#   amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are
#   1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10_000.

# this is d(n) from the prompt.
def get_sum_of_divisors(num: int) -> int:
    if num < 2:
        return num
    total = 0
    i = 1
    while i ** 2 < num:
        if num % i == 0:
            if num / i == i:
                total += i
            else:
                total += i
                total += num//i
        i += 1

    total -= num
    return total

def has_amicable(a: int) -> bool:
    if a < 2:
        raise Exception("Invalid domain")
    b = get_sum_of_divisors(a)
    a_inverse = get_sum_of_divisors(b)
    return (a == a_inverse and a != b)


total = 0
for a in range(2, 10_000):
    if has_amicable(a):
        total += a

print(total)
# -> 31626
