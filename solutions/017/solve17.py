# https://projecteuler.net/problem=17
# Run with: 'python solve17.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# If the numbers 1 to 5 are written out in words:
#   one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used? 
# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters and 
# 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

ones = {
    0: "",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
}

tens = {
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
    16: "sixteen",
    17: "seventeen",
    18: "eighteen",
    19: "nineteen",
    20: "twenty",
    30: "thirty",
    40: "forty",
    50: "fifty",
    60: "sixty",
    70: "seventy",
    80: "eighty",
    90: "ninety",
}

def get_word_form(num: int) -> str:
    if num > 1_000:
        raise Exception("Number too large")

    if num < 10:
        return ones[num]
    elif num <= 20:
        return tens[num]
    elif num < 100:
        return tens[(num // 10) * 10] + ones[int(num % 10)]
    elif num % 100 == 0 and num < 1_000:
        return ones[num // 100] + "hundred"
    elif num < 1_000:
        return ones[num // 100] + "hundredand" + get_word_form(num % 100)
    elif num == 1_000:
        return "onethousand"

letters_used = 0
for number in range(1, 1_000 + 1):
    letters_used += len(get_word_form(number))

print(letters_used)
# -> 21124
