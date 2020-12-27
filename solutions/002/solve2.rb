# https://projecteuler.net/problem=2
# Run with: 'ruby solve2.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# Each new term in the Fibonacci sequence is generated by adding the previous two terms.
# By starting with 1 and 2, the first 10 terms will be:
#   1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

arr = [0, 1]

# generate fib numbers while less than 4 million
while arr[arr.size - 1] < 4_000_000
  arr.append(arr[arr.size - 2] + arr[arr.size - 1])
end

# Remove [0, 1] from beginning
arr = arr.drop(2)

# filter for even values
arr = arr.reject { |i| i % 2 != 0 }

# sum all even values
p arr.reduce(0) { |acc, num| acc + num }

# -> 4613732
