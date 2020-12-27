# https://projecteuler.net/problem=9
# Run with: 'ruby solve9.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#  a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for
# which a + b + c = 1000.
#
# Find the product abc.

# This uses the primes generation formula from:
# https://www.mathsisfun.com/numbers/pythagorean-triples.html

SUM = 1_000

class Triples
  def initialize(m, n)
    raise "invalid inital value" unless m > n
    @a = m**2 - n**2
    @b = 2*m*n
    @c = m**2 + n**2
  end
  def sum
    return @a + @b + @c
  end
  def valid?
    if @a**2 + @b**2 == @c**2
      if self.sum == SUM
        return true
      end
    end
    return false
  end
  def solve
    return @a*@b*@c
  end
end

# theoretically O(n),
# but in practice it returns early.
(2..SUM).each do |m|
  (1..SUM).each do |n|
    break if n >= m
    triples = Triples.new(m, n)
    if triples.valid?
      p triples.solve
      return 
    end 
  end
end

# -> 31875000
