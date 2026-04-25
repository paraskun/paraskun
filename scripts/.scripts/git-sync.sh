#!/bin/bash

# Notes

cd $HOME/notes
git add .
git commit -m "$(date +%D): sync"
git push origin trunk

