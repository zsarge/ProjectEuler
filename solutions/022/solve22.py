# https://projecteuler.net/problem=22
# Run with: 'python solve22.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# Using p022_names.txt,
# a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list
# to obtain a name score.
#
# For example, when the list is sorted into alphabetical order,
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53,
#   is the 938th name in the list.
# So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

names = []
with open("p022_names.txt", "r") as f:
    text = f.read()
    names = text.replace('"', "").split(",")

names.sort()

def letter_value(letter: str) -> int:
    if len(letter) != 1:
        raise Exception("letter_value expects one letter")
    return (ord(letter) - ord("A") + 1)

# alphabetical value
def alpha_value(name: str) -> int:
    value = 0
    for letter in name:
        value += letter_value(letter)
    return value

def position(name: str) -> int:
    return names.index(name) + 1

def name_score(name: str) -> int:
    return position(name) * alpha_value(name)

total = 0
for name in names:
    total += name_score(name)

print(total)
# -> 871198282
