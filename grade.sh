#!/bin/bash

# grade.sh: A script to assign grades based on input score

# Prompt the user for a numeric score
read -p "Enter the numeric score (0-100): " score

# Check if input is valid
if ! [[ "$score" =~ ^[0-9]+$ ]] || [ "$score" -lt 0 ] || [ "$score" -gt 100 ]; then
    echo "Invalid input. Please enter a number between 0 and 100."
    exit 1
fi

# Assign grades based on score
if [ "$score" -ge 90 ]; then
    grade="A"
elif [ "$score" -ge 80 ]; then
    grade="B"
elif [ "$score" -ge 70 ]; then
    grade="C"
elif [ "$score" -ge 60 ]; then
    grade="D"
else
    grade="F"
fi

# Output the grade
echo "The grade for a score of $score is: $grade"
