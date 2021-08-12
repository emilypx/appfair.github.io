#!/bin/sh
for file in *.mmd; do
    echo "Compiling diagram: ${file}…"
    mmdc -i ${file} -o `basename $file .mmd`.svg
done

