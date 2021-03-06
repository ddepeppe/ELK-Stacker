#!/bin/bash


#!find . -name "$1*" -exec  grep -H -E "$2.$3" {} \;| awk -F' ' '{print $1,$2,$5,$6}' This works but prints filename why?  how to combine time and am/pm?

#!find . -name "$1*" -exec  grep -H -E "$2.$3" {} \;  This works

# ! enter parameters as: date and time ex.  0312 11:00:00 PM

find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$5,$6}'
















