# https://projecteuler.net/problem=52
# Run with: 'ruby solve52.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# It can be seen that the number, 125874, and its double, 251748, contain exactly 
# the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2*x, 3*x, 4*x, 5*x, and 6*x,
# contain the same digits.

def unique_digits(i, x) 
  (i * x).to_s.chars.sort.uniq.join
end

def check?(x)
  ref = unique_digits(2, x)
  (3..6).all? {|i| unique_digits(i, x) == ref}
end

p (1..).find {|x| check? x}
# -> 142857
