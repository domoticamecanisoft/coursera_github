#!/usr/bin/env bash
# simple-interest.sh
# This script calculates simple interest given principal, annual rate, and time.

# Usage function
display_usage() {
  echo "Usage: $0 -p PRINCIPAL -r RATE -t TIME"
  echo
  echo "  -p PRINCIPAL    Principal amount (e.g., 1000)"
  echo "  -r RATE         Annual interest rate in percent (e.g., 5 for 5%)"
  echo "  -t TIME         Time in years (e.g., 2)"
  echo
  echo "Example: $0 -p 1000 -r 5 -t 2" 
}

# Check if no arguments were provided\if [ $# -eq 0 ]; then
  display_usage
  exit 1
fi

# Parse command-line options
while getopts ":p:r:t:h" opt; do
  case ${opt} in
    p ) principal=${OPTARG} ;; 
    r ) rate=${OPTARG} ;; 
    t ) time=${OPTARG} ;; 
    h ) display_usage; exit 0 ;;
    \? ) echo "Invalid option: -$OPTARG"; display_usage; exit 1 ;;
    : ) echo "Option -$OPTARG requires an argument."; display_usage; exit 1 ;;
  esac
done

# Validate inputs
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
  echo "Error: All parameters -p, -r, and -t are required."
  display_usage
  exit 1
fi

# Calculate simple interest: (P * R * T) / 100
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

echo "Simple Interest Calculation"
echo "-----------------------------"
echo "Principal: $principal"
echo "Rate (%):  $rate"
echo "Time (yrs): $time"
echo "-----------------------------"
echo "Interest: $interest"
