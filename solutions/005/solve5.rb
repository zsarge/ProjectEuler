# https://projecteuler.net/problem=5
# Run with: 'ruby solve5.rb'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# I gotta admit, I haven't done anything with factors and multiples since like 6th grade.
# These pages are useful if you want to double check what you know:
#   https://www.mathsisfun.com/least-common-multiple.html
#   https://www.mathsisfun.com/greatest-common-factor.html

def is_divisible?(factor, number)
  number % factor == 0
end

def is_completely_divisible?(num, range)
  range.each { |val|
    # return early at first false
    return false unless is_divisible?(val, num)
  }
  # no falses were found
  return true
end

# we can make our solution faster be getting rid
# of all of the numbers we don't need to check.
# For example, if a number is evenly divisible by 10,
# it is divisible by 5, so we don't need to check 5.
def prune_range(range)
  range = range.to_a
  range.reverse_each { |factor|
    range.each { |number|
      if is_divisible?(factor, number) && factor != number
        range.delete(factor)
      end
    }
  }
  return range
end

def get_smallest_evenly_divisible(range)
  range = prune_range(range)
  increase = 2520 # = get_smallest_evenly_divisible(1..10)

  (increase..).step(increase).find{|i| is_completely_divisible?(i, range)}
end

puts get_smallest_evenly_divisible(1..20)

# -> 232792560


__END__

# The following was my initial approach, which works
# well enough for low numbers, but does not
# scale well and takes wayy to long for larger numbers.
#
# In order to make it scale well, I reduced the range it 
# operates on, and increased the step to check fewer numbers.
# I'm sure there's a fancy math thing I'm missing, but this works.

def is_completely_divisible?(num, range)
  range.each {|val|
    # return early at first false
    return false unless num % val == 0
  }
  # no falses were found
  return true
end

def get_smallest_evenly_divisible(range)
  i = range.first
  while !is_completely_divisible?(i, range)
    i += 1
  end
  return i
end

p get_smallest_evenly_divisible((1..10))
