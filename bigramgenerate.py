from nltk import bigrams
import re

out_f = open('myfile','w')

with open('tyv.bible.ibt.txt','r') as f:
    for line in f:
        bgrams = list(bigrams(line.split()))
        for grams in bgrams:
            if re.search("[A-Za-z]", grams[0]) == None and re.search("[A-Za-z]", grams[1]) == None:
                out_f.write(re.sub("\d", "?", grams[0].rstrip('?:!.,;')) + " " + re.sub("\d", "?", grams[1].rstrip('?:!.,;')) + "\n")
