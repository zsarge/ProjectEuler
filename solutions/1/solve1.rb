# https://projecteuler.net/problem=1
# Run with: `ruby solve1.rb`
# using Ruby 2.5.1
# by Zack Sargent

total = 0

0.upto(1000 - 1) { |i| 
	total += i if i % 3 == 0 || i % 5 == 0
}

p total

