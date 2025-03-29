
"""
    Exercise Link: https://www.hackerrank.com/challenges/words-score/problem?isFullScreen=true

    Consider that vowels in the alphabet are a, e, i, o, u and y.

    Function score_words takes a list of lowercase words as an argument and returns a score as follows:

    The score of a single word is 2 if the word contains an even number of vowels. Otherwise, the score of 
    this word is 1. The score for the whole list of words is the sum of scores of all words in the list.

    Debug the given function score_words such that it returns a correct score.

    Your function will be tested on several cases by the locked template code.

    Input Format

    The input is read by the provided locked code template. In the first line, there is a single integer 
    n denoting the number of words. In the second line, there are  space-separated lowercase words.

    Each word has at most  letters and all letters are English lowercase letters
    
    Output Format

    The output is produced by the provided and locked code template. It calls function score_words with the 
    list of words read from the input as the argument and prints the returned score to the output.
    """

def is_even(n):
    return (n % 2 == 0)

def is_vowel(letter):
    return letter in ['a', 'e', 'i', 'o', 'u', 'y']
    
def count_vowels(word):
    count = 0
    for letter in word:
        if(is_vowel(letter)):
            count += 1
    return count

def score_words(words):
    vowels = [count_vowels(word) for word in words]
    scores = [2 if is_even(vowel_count) else 1 for vowel_count in vowels]
    return sum(scores)

n = int(input())
words = input().split()
print(score_words(words))
