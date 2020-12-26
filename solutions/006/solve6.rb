# https://projecteuler.net/problem=6
# Run with: 'ruby solve6.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# The sum of the squares of the first ten natural numbers is,
#   1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#   (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
# 

class Array
  def sum
    self.inject(0, :+)
  end
end

p (1..100).to_a.sum ** 2 - (1..100).map{|n| n**2}.sum

# -> 25164150

__END__
# Explanation:

(1..100).to_a.sum ** 2
# gets the sum of all numbers from 1 to 100, squared

(1..100).map{|n| n**2}.sum
# squares all numbers from 1 to 100, and gets the sum

# The sqare of sums is then subtracted from the sum of squares.
