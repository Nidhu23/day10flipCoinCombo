#!/bin/bash -x
echo "Welcome to Flip coin problem "
if [[ $(($RANDOM%2)) -eq 0 ]]
then
        echo "Heads"
else
        echo "Tails"
fi
