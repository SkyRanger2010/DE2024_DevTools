#!/bin/bash

LINES=$(wc -l input.txt | awk '{print $1}')
WORDS=$(wc -w input.txt | awk '{print $1}')
LETTERS=$(grep -o '[A-Za-z]' input.txt | wc -l)

echo "Input file contains:
$LETTERS letters
$WORDS words
$LINES lines" > output.txt
