# https://projecteuler.net/problem=25
# Run with: 'python solve25.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
#
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
# What is the index of the first term in the Fibonacci sequence
# to contain 1000 digits?

# using yield to make a generator.
# we use multiple assignments to skip 
# the traditional third variable.
def fibonacci() -> int:
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

count = 0
for i in fibonacci():
    if len(str(i)) == 1_000:
        break
    else:
        count += 1

print(count)
# -> 4782
