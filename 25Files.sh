#!/bin/bash

# Define the base filename to use (replace "yourName" with your actual name)
base_filename="ABarry"

# Determine the last or maximum number that already exists
last_file=$(ls -1 "${base_filename}"* 2>/dev/null | tail -n 1)
if [ -z "$last_file" ]; then
  last_number=0
else
  last_number=${last_file#$base_filename}
  last_number=${last_number%%.*}
fi

# Create the next batch of 25 files with increasing numbers
for i in $(seq 1 25); do
  next_number=$((last_number+i))
  touch "${base_filename}${next_number}"
done

# Display a long list of the directory and its contents to validate that the script created the expected files
ls -l
