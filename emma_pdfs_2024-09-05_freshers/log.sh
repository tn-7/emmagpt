#!/bin/bash
BIN=../bin/xpdf-tools-mac-4.05/binARM/ # need to download and install
PROJECT=`pwd`; cd "$PROJECT"

for pdf in *.pdf
do
    text=$(basename "$pdf" .pdf)
    txtfile="$text.txt"
    
    # Convert PDF to text from xpdf_tools
    "$BIN"/pdftotext -enc UTF-8 -eol unix -table "$pdf" "$txtfile"
    
    # Prepend the filename at the top of the text file
    echo "File: $pdf" | cat - "$txtfile" > temp && mv temp "$txtfile"
    
done

cat *.txt > all_compiled.md