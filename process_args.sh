#!/bin/bash

# Initialize flags
t_flag=0
v_flag=0
f_flag=0
z_flag=0
p_flag=0
ofile=""

echo "Starting script with arguments: $@"

# Process command-line arguments using a while loop
while [ $# -gt 0 ]; do
  echo "Processing argument: $1"
  case "$1" in
    -t) t_flag=1 ;;
    -v) v_flag=1 ;;
    -f) f_flag=1 ;;
    -z) z_flag=1 ;;
    -p) p_flag=1 ;;
    -o) 
      shift
      ofile="$1"
      ;;
    *) 
      echo "Error: Invalid option '$1'"
      exit 1
      ;;
  esac
  shift
done

# Output the status of each flag
echo "t_flag: $t_flag"
echo "v_flag: $v_flag"
echo "f_flag: $f_flag"
echo "z_flag: $z_flag"
echo "p_flag: $p_flag"
echo "Output file: $ofile"
