# https://projecteuler.net/problem=7
# Run with: 'ruby solve7.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# By listing the first six prime numbers:
#   2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
# What is the 10,001st prime number?
 
require 'prime'
p Prime.take(10_001).last

# -> 104743

# We could write a full prime generator,
# but, as a rubyist, I'm lazy and don't feel like it.
