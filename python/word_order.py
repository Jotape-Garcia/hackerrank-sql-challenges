
"""
    Exercise Link: https://www.hackerrank.com/challenges/word-order/problem?isFullScreen=true

    You are given n words. Some words may repeat. For each word, output its number of occurrences. The 
    output order should correspond with the input order of appearance of the word. See the sample 
    input/output for clarification.

    Note: Each input line ends with a "\n" character.

    Constraints:

    The sum of the lengths of all the words do not exceed 10**6
    All the words are composed of lowercase English letters only.

    Input Format

    The first line contains the integer, n.
    The next  lines each contain a word.

    Output Format

    Output 2 lines.
    On the first line, output the number of distinct words from the input.
    On the second line, output the number of occurrences for each distinct word according to their 
    appearance in the input.
"""

#   Solution 1

def count_words(words):
    visited_words = []
    word_count = []
    for word in words:
        if(word not in visited_words):
            visited_words.append(word)
            reps = words.count(word)
            word_count.append(str(reps))

    return (len(word_count), 
            " ".join(word_count))
    
n = int(input())
words = [input() for i in range(n)]
total, count = count_words(words)

print(total)
print(count)

#   Solution 2 (Optimized)

def count_words(words):
    word_count = {}
    for word in words:
        word_count[word] = word_count.get(word, 0) + 1
    
    unique_words = list(word_count.keys())    
    
    return (len(unique_words), 
            " ".join(map(str, word_count.values())))
    
n = int(input())
words = [input() for i in range(n)]
total, count = count_words(words)

print(total)
print(count)
