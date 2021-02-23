#!/bin/bash

echo -e "const randomArray = [\c" > $1

for i in $(seq $(($2 - 1)))
do
    echo -e "$RANDOM, \c" >> $1
done
    echo -e "$RANDOM" >> $1

echo "];" >> $1