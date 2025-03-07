#!/bin/bash

PHRASES=("Bruh this is docker" "THERE WE GO AGAIN" "ITS TIME NOW")

RANDOM_INDEX=$(( RANDOM % ${#PHRASES [@]}))

SELECTED_PHRASE=${PHRASES[$RANDOM_INDEX]}

figlet -w 200 -f starwars "$SELECTED_PHRASE"