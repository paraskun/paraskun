#!/bin/bash

export HOME=/home/paraskun

echo "Syncing notes..."
cd /home/paraskun/notes
/usr/bin/git add .
/usr/bin/git commit -m "$(/usr/bin/curl -s https://whatthecommit.com/index.txt)"
/usr/bin/git push origin trunk

