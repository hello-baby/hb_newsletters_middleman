#!/bin/bash

cat "build/newsletters/$1.html" | mail -s "$(echo -e "${3:-Test email}\nContent-Type: text/html")" $2