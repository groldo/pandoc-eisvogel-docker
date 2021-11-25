#!/usr/bin/env bash

ARGS="${@:2}"
FILE=$1
case "$1" in
    "pandoc")
        pandoc $ARGS
        ;;
    *)
        pdflatex $1 $ARGS
        ;;
esac

