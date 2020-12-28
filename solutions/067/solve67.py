# https://projecteuler.net/problem=67
# Run with: 'python solve67.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
# Find the maximum total from top to bottom in p067_triangle.txt, a 15K text file containing a triangle with one-hundred rows.
# NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

FILE_NAME = "p067_triangle.txt"

triangle = []
# process file into same array structure from problem 18
with open(FILE_NAME, "r") as f:
    text = f.read().rstrip()
    # split into list of strings by newlines:
    text = text.split("\n")
    # split into list of lists of strings by spaces:
    for i in range(0, len(text)):
        text[i] = text[i].split(" ")
    # turn list of lists of strings into list of lists of ints.
    for i in range(0, len(text)):
        for j in range(0, len(text[i])):
            text[i][j] = int(text[i][j])
    triangle = text

# The following is from `solutions/018/solve18.py`:

# from the bottom to the top
for i in reversed(range(0, len(triangle)-1)):
    # find the maximum sum of the numbers to the left and right
    for j in range(0, i + 1):
        triangle[i][j] += max(triangle[i+1][j], triangle[i+1][j+1])

# This collapses the tree with the solution at (0,0)

print(triangle[0][0])
# -> 7273
