#!/bin/bash


#!find . -name "$1*" -exec  grep -H -E "$2.$3" {} \;| awk -F' ' '{print $1,$2,$5,$6}' This works but prints filename why?  how to combine time and am/pm?

#!find . -name "$1*" -exec  grep -H -E "$2.$3" {} \;  This works


#! Enter parameters as date, time and game (R, B or T)  ex. 0310 11:00:00 PM R

if [ "$4" == "R" ]; then

   find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$5,$6}'

elif [ "$4" == "B" ]; then

  find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$3,$4}'

else


  find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$7,$8}'

fi
