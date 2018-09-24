#!/bin/bash

FORCE="$1"
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"
TEMPLATE_PATH="$7"
TEMPLATE_NAME="$8"
TEMPLATE_EXT="$9"

FILE=$(basename "$INPUT")
FILENAME=$(basename "$INPUT" .$EXTENSION)
FILEPATH=${INPUT%$FILE}
OUTDIR=${OUTPUTDIR%$FILEPATH*}
OUTPUT="$OUTDIR"/$FILENAME
CSSFILENAME=$(basename "$6")
TPL=$TEMPLATE_PATH$TEMPLATE_NAME$TEMPLATE_EXT

HAS_MATH=$(grep -o "\$\$.\+\$\$" "$INPUT")

if [ ! -z "$HAS_MATH" ]; then
    MATH="--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
else
    MATH=""
fi


if [ ! -e $CSSFILE ]; then
    echo "create css file"
    cp ~/.vim/wiki/github-pandoc.css $OUTDIR
fi
if [ ! -e $TPL ]; then
    echo "Please create you own template file"
    TPL=~/.vim/wiki/default.html
fi


# >&2 echo "MATH: $MATH"
# echo $CSSFILENAME
# echo $MATH
# echo $FORCE
# echo $INPUT
# echo $CSSFILE
# echo $OUTDIR

sed -r 's/(\[.+\])\(([^)]+)\)/\1(\2.html)/g' < "$INPUT" |\
    pandoc --toc $MATH --template=$TPL -s -f $SYNTAX -t html -c $CSSFILENAME |\
    sed -r 's/<li>(.*)\[ \]/<li class="todo done0">\1/g; s/<li>(.*)\[X\]/<li class="todo done4">\1/g' >"$OUTPUT.html"
