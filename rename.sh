#!/bin/bash

MOVIE=$1

YEAR=$(echo $MOVIE | awk -F'[^1900-2018]*' {'print $2'})

TITLE=$(echo $MOVIE | awk -F"$YEAR" '{print $1}' | tr '.' ' ')

RENAME="$TITLE ($YEAR)"

mv "$MOVIE" "$RENAME"
