#!/bin/bash

# Set input and output filenames
input="README.md"
output=""

# Loop through each line of the input file
while read line
do
  # Check if the line is a second-level header
  if [[ $line =~ ^##\ (.*) ]]; then
    # If it is, set the output filename based on the header text
    output="${BASH_REMATCH[1]}.md"
  fi

  # If we have an output filename, write the current line to that file
  if [[ ! -z "$output" ]]; then
    echo "$line" >> "Units/$output"
  fi

#   # Check if the line is a third-level header
#   if [[ $line =~ ^###\  ]]; then
#     # If it is, we're done writing to the current output file
#     output=""
#   fi

done < "$input"
