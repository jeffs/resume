#!/bin/sh
set -eu
cd "$(dirname "$0")"

pandoc README.md \
    --standalone \
    --embed-resources \
    --css=resume.css \
    -o pdf.html 2>/dev/null

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    --headless=new \
    --disable-gpu \
    --no-pdf-header-footer \
    --print-to-pdf=jeff-schwab.pdf \
    "file://$PWD/pdf.html"
