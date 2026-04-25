#!/bin/bash

hyprlock &

. /home/paraskun/.scripts/git-sync.sh

systemctl suspend
