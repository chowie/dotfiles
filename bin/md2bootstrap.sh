#!/bin/bash

myfile=$@
filename=$(basename "$myfile")
extension="${filename##*.}"
filename="${filename%.*}"

HTML_BOOTSTRAP=${HOME}/Documents/code-snippets/pandoc-bootstrap-template/template.html 
CSS_BOOTSTRAP=${HOME}/Documents/code-snippets/pandoc-bootstrap-template/template.css 

if [ -f "${myfile}" ]; then
    pandoc -f markdown -s $myfile -o ${filename}.html --template $HTML_BOOTSTRAP --css $CSS_BOOTSTRAP --self-contained --toc --toc-depth 2;
else
    echo "File not found!  ${myfile}"
fi
