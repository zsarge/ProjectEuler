# https://projecteuler.net/problem=1
# Run with: `ruby solve1.rb`
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

total = 0

0.upto(1000 - 1) { |i| 
	total += i if i % 3 == 0 || i % 5 == 0
}

p total

# -> 233168
