# https://projecteuler.net/problem=19
# Run with: 'python solve19.py'
# using Python 3.6.9
# by Zack Sargent

# Prompt:

# You are given the following information,
# but you may prefer to do some research for yourself.
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4,
#   but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during
# the twentieth century (1 Jan 1901 to 31 Dec 2000)?

month_to_days = {
    1: 31,   # January
    2: None, # February
    3: 31,   # March
    4: 30,   # April
    5: 31,   # May
    6: 30,   # June 
    7: 31,   # July
    8: 31,   # August
    9: 30,   # September
    10: 31,  # October
    11: 30,  # November
    12: 31,  # December
}

class Week:
    # day = 0..6, Monday to Sunday
    def __init__(self):
        self.day = -1
    def is_sunday(self) -> bool:
        return self.day == 6
    def next_day(self):
        if self.day < 6:
            self.day += 1
        else:
            self.day = 0

def get_days(month: int) -> int:
    if month == 2: # February
        if year % 100 != 0 or year % 400 == 0:
            if year % 4 == 0:
                return 29
        return 28
    else:
        return month_to_days[month]

week = Week()

sundays = 0
for year in range(1900, 2000 + 1):
    for month in range(1, 12 + 1):
        days = get_days(month)
        for day in range(1, days + 1):
            week.next_day()
            if year >= 1901:
                if day == 1 and week.is_sunday():
                    sundays += 1

print(sundays)
# -> 171
