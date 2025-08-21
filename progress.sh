#!/usr/bin/env bash

# Usage: ./progress.sh
# Displays progress with style 🚀

set -euo pipefail

exercise_dir=exercises
done=$(find "$exercise_dir" -type f | sed 's/\.[^.]*$//' | sort -u | wc -l)
total=356

percent=$(( done * 100 / total ))

bar_length=40
filled=$(( percent * bar_length / 100 ))
empty=$(( bar_length - filled ))

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
BOLD="\033[1m"
RESET="\033[0m"

bar="[${GREEN}$(printf '%0.s#' $(seq 1 $filled))${RESET}$(printf '%0.s-' $(seq 1 $empty))]"

# Epic output
echo -e "${CYAN}${BOLD}🚀 Progress Tracker 🚀${RESET}"
echo -e "$bar ${YELLOW}$percent%${RESET}"
echo -e "✅ Completed: ${GREEN}$done${RESET} / $total"
