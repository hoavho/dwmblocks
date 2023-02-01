#!/bin/sh
#ICON="📅"
#ICON="📅"
ICON="🗓️"
printf "\x10 $ICON%s \x0f%s" "$(date '+%a %m/%d')" "$(date '+%R')"
