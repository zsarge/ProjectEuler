# https://projecteuler.net/problem=3
# Run with: 'ruby solve3.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def getPrimeFactors(goal)
  factors = []
  i = 1
  while i < (goal)
    i += 1
    if goal%i == 0
      goal /= i
      factors.append(i)
    end
  end
  return factors
end

p getPrimeFactors(600851475143).last

# -> 6857
