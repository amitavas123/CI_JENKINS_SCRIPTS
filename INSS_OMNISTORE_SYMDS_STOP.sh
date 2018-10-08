#! /bin/bash

#Name: Stopping the SYM DS server

pgrep -d" " -f "symmetric" | xargs kill;
echo "Stopping SYM DS successfully"

