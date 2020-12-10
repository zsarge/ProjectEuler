# Run this script to create a new solution
# Run by using 'ruby addSolution.rb {challenge number}'
# or by just 'ruby addSolution.rb'
#
# This assumes you are running a linux like system.

require 'open-uri'
require 'nokogiri'

def getProblemText(num) 
  url = "https://projecteuler.net/problem=#{num}"
  doc = Nokogiri::HTML(URI.open(url))
  content = doc.css('div.problem_content')
  return content.text.gsub("\r","").gsub("\n", "\n# ").chomp
end

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

# do not overwrite existing files
if File.directory?("solutions/#{problemNumber}")
  puts "Directory Exists. Exiting" 
  exit(1)
end

template = "# https://projecteuler.net/problem=#{problemNumber}
# Run with: 'ruby #{filename}'
# using Ruby 2.5.1
# by Zack Sargent

# Prompt:
#{getProblemText(problemNumber)}
puts 'Hello World!'
"

Dir.mkdir("solutions/#{problemNumber}")
File.write("solutions/#{problemNumber}/#{filename}", template, mode: "w")

puts "created solutions/#{problemNumber}/#{filename}"
