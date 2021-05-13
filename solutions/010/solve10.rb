# https://projecteuler.net/problem=10
# Run with: 'ruby solve10.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require 'prime'

LIMIT = 2_000_000

p Prime.take_while { |prime| prime < LIMIT }.sum
# -> 142913828922
