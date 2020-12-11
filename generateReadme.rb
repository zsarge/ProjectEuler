# This script makes a README.md with links to all my solutions.
# Run it with 'ruby generateReadme.rb' 
# This was written using Ruby 2.5.1
# by Zack Sargent

HEADER = "\
# [Project Euler](https://projecteuler.net)

These are my solutions for various [Project Euler](https://projecteuler.net) problems.

I use Project Euler mainly for programming challenges, but it also is nice to practice mathematical thinking.

Every solution gets its own directory, because I plan on varying the languages I use, and this keeps everything uniform.

## My solutions:
"

# Start table generation

def makeColumnElement(number, width)
  width += 2 # add more spacing
  string = number
  string.prepend("| ")
  return "" if number.nil? || width - number.size <= -1
  string << (" " * (width - number.size))
  return string
end

def makeRow(array, widths)
  row = ""
  col = 0
  array.each { |ele|
    row << makeColumnElement(ele, widths[col] + 1)
    col += 1
  }
  row << "|\n"
  return row
end

def makeHeader(widths)
  row = ""
  widths.each { |width|
    row << makeColumnElement("-"*(width), width + 1)
  }
  row << "|\n"
  return row
end

def getWidths(array, cols)
  widths = []
  1.upto(cols) do |i|
    column = []
    (i..array.size).step(cols) do |j|
      column.append(array[j-1])
    end
    widths.append(column.max_by(&:length).size)
  end
  return widths
end

# makeTable takes an array of strings to be formatted as a
# markdown table. The number of elements in the array needs to
# be evenly divisble by the number of columns.
def makeTable(array, cols)
  return nil unless array.size%cols == 0
  table = []
  # width = array.max_by(&:length).size
  widths = getWidths(array, cols)

  # loop through array by row
  (1..array.size).step(cols) do |i|
    # section = row, accounting for index changes
    section = array[i-1..i+cols-2]
    table.append(makeRow(section, widths))
  end

  table.insert(1, makeHeader(widths))
  return table.join
end

# Stop table generation
# Start content generation

def getFilesInDir(dir)
  files = Dir.entries(dir)
  files = files.drop(2) # drop '.' and '..'
  return files
end

def makeLink(files, dirName)
  raise "Multiple files not implemented." unless files.size == 1
  return "[#{dirName.to_i}](solutions/#{dirName}/#{files[0]})"
end

# takes a name of solution and the solutions,
# and returns either a link to the solution
# or the name if the solution doesn't exist
def getLink(name, solutions)
  name = name.to_i
  if solutions.key?(name)
    return solutions[name]
  else
    return name
  end
end


names = getFilesInDir("solutions")

files = {}
names.each do |name|
  solutions = getFilesInDir("solutions/#{name}")
  files.store(name.to_i, makeLink(solutions, name))
end

arr = (1..100).to_a
arr = arr.map { |num| getLink(num, files) }
arr = arr.map(&:to_s)

# represent dir as array of objects where
# dir = [
#   "1" => link to first answer,
#   "2" => link to second answer,
# ]

# Create blank space in header:
10.times do arr.prepend(" ") end

TABLE = makeTable(arr, 10)
puts TABLE

# Stop content generation
# Start writing to file

content = "\
#{HEADER}

#{TABLE}
"

File.write("README.md", content, mode: "w")

# Stop writing to file
