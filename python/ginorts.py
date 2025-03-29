
"""
    You are given a string S.
    S contains alphanumeric characters only.

    Your task is to sort the string  in the following manner:

    - All sorted lowercase letters are ahead of uppercase letters.
    - All sorted uppercase letters are ahead of digits.
    - All sorted odd digits are ahead of sorted even digits.

    Input Format

    A single line of input contains the string S.

    Output Format

    Output the sorted string S.
"""

def is_even(n):
    return n % 2 == 0

def sort_word(s):
    return "".join(sorted(s, key=lambda c: (
        c.isdigit(),
        c.isupper(),
        is_even(int(c)) if c.isdigit() else False,
        c
    )))

s = input()
print(sort_word(s))
