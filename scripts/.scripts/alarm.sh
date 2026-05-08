#!/bin/sh

sleep ${1}s && hyprctl notify 1 ${1}000 0 "Time's Up!"
