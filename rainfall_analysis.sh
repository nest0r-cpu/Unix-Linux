#!/bin/bash

# Calculate the average rainfall
calculate_average() {
  local total=0
  for value in "${rainfall[@]}"; do
    total=$((total + value))
  done
  echo $((total / count))
}

# Find the smallest and largest rainfall values
find_min_max() {
  min=${rainfall[0]}
  max=${rainfall[0]}

  for value in "${rainfall[@]}"; do
    if (( value < min )); then
      min=$value
    fi
    if (( value > max )); then
      max=$value
    fi
  done
}

# Main script
rainfall=()
max_values=25

# Reads 25 rainfall values from the user
echo "Enter up to $max_values weekly rainfall values (press Enter after each, or type 'done' to finish):"
while read -r input; do
  if [[ $input == "done" ]]; then
    break
  elif [[ $input =~ ^[0-9]+$ ]]; then
    rainfall+=("$input")
    if (( ${#rainfall[@]} == max_values )); then
      break
    fi
  else
    echo "Invalid input. Please enter a positive integer or 'done' to finish."
  fi

done

# Counts the number of values entered
count=${#rainfall[@]}
echo "\nYou entered $count values."

# Calculate the average rainfall
if (( count == 0 )); then
  echo "No rainfall data provided. Exiting."
  exit 1
fi
average=$(calculate_average)
echo "Average rainfall: $average"

# Display rainfall values and deviation
echo -e "\nRainfall values and deviation from average:"
for ((i = 0; i < count; i++)); do
  deviation=$((rainfall[i] - average))
  echo "Week $((i + 1)): Rainfall = ${rainfall[i]}, Deviation = $deviation"
done

# Find and display the values
find_min_max
echo -e "\nSmallest rainfall value: $min"
echo "Largest rainfall value: $max"
