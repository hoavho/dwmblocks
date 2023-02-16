#!/bin/sh
#exec "$TERMINAL" -e htop -s PERCENT_CPU ;
# 1 = Left Click (dwm button click event)
# 2 = Middle Click (dwm button click event)
# 3 = Right Click (dwm button click event)
case "$1" in
    1) exec "$TERMINAL" -e htop -s PERCENT_MEM ;;
    2) exec "$TERMINAL" -e htop -s PERCENT_MEM ;;
    3) exec "$TERMINAL" -e htop -s PERCENT_MEM ;;
esac
