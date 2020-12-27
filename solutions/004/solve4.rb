# https://projecteuler.net/problem=4
# Run with: 'ruby solve4.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

# Steps:
# 1) Generate the products of all n digit numbers
# 2) Filter those that are palendromic
# 3) Find the largest result

def is_palindrome?(num)
  return (num.to_s.reverse == num.to_s)
end

def palindromic_number(digits)
  return if digits < 1
  largest = 10 ** digits - 1
  products = []

  i = 0
  while i <= largest
    j = 0
    while j <= largest
      products.append(j * i)
      j += 1
    end
    i += 1
  end

  products.keep_if { |num| is_palindrome?(num) }
  return products.max
end

p palindromic_number(3)
# -> 906609
