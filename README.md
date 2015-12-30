# TesseractTools
These are some tools for training tesseract. Description of each below:

## bigramgenerate.py
Generates word bigrams (to eventually be converted into bigram-dawg) using a file (currently not command line args - must change in file)

## training_fix.rb
Fixes your training set (named training.txt) by trying to get as little characters possible (10 minimum is the target). Outputs training-fixed.txt.

## word_list_gen.rb
Generates a wordlist (to eventually be converted into word-dawg) using an array of files (currently not command line args - must change in file)
