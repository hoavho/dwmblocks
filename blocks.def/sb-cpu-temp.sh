#!/bin/sh

case $BLOCK_BUTTON in
	1) notify-send "🖥 CPU hogs" "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)\\n(100% per core)" ;;
	2) setsid -f "$TERMINAL" -e htop ;;
	3) notify-send "🖥 CPU module " "\- Shows CPU temperature.
- Click to show intensive processes.
- Middle click to open htop." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Urgent = 3, Warn = 4, Normal = 5, Title = 6, Warn = 7, Critical = 8
# colored output values - from \x0b to \x1f
# 1.  \x0b == 11 (1st color in colors[])
# 2.  \x0c == 12
# 3.  \x0d == 13
# 4.  \x0e == 14
# 5.  \x0f == 15
# 6.  \x10 == 16
# 7.  \x11 == 17
# 8.  \x12 == 18
# 9.  \x13 == 19
# 10. \x14 == 20
# 11. \x15 == 21
# 12. \x16 == 22
# 13. \x17 == 23
# 14. \x18 == 24
# 15. \x19 == 25
# 16. \x1a == 26
# 17. \x1b == 27
# 18. \x1c == 28
# 19. \x1d == 29
# 20. \x1e == 30
# 21. \x1f == 31
sensors | awk '/Core 0/ {print "\x10🌡" $3}'
