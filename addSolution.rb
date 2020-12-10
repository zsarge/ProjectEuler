# Run this script to create a new solution
# Run by using 'ruby addSolution.rb {challenge number}'
# or by just 'ruby addSolution.rb'
#
# This assumes you are running a linux like system.

problemNumber = ""

if ARGV.length == 0
  puts "enter the challenge number"
  problemNumber = gets.chomp

  puts "create #{problemNumber}? (y/n)"
  input = ""

  while input.downcase.count("yn") <= 0 
    input = gets.chomp
  end

  return if input.downcase.count("n") >= 1
else
  problemNumber = ARGV[0]
end

filename = "solve#{problemNumber}.rb"

template = "# https://projecteuler.net/problem=#{problemNumber}
# Run with: 'ruby #{filename}'
# using Ruby 2.5.1
# by Zack Sargent

puts 'Hello World!'
"

`mkdir solutions/#{problemNumber}`
`touch solutions/#{problemNumber}/#{filename}`
`echo "#{template}" > solutions/#{problemNumber}/#{filename}`

puts ""
puts "created solutions/#{problemNumber}/#{filename}"
