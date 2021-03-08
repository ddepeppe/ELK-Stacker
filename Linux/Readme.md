The Linux folder contains shell scripts to uncover the identities of the rogue casino player and dealer colluding to scam Lucky Duck out of thousands of dollars by
correlating the large losses from the roulette tables with the dealer schedule and analyzing dates, games and dealers to identify the thieves.

roulette_dealer_finder_by_time.sh

    #!/bin/bash

    # ! enter parameters as: date and time ex.  0312 11:00:00 PM

    find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$5,$6}'

roulette_dealer_finder_by_time_and_game.sh

    #!/bin/bash
    #! Enter parameters as date, time and game (R, B or T)  ex. 0310 11:00:00 PM R

    if [ "$4" == "R" ]; then

    find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$5,$6}'

    elif [ "$4" == "B" ]; then

    find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$3,$4}'

    else

    find . -name "$1*" -exec  grep -H -E "$2.$3" {} \; | awk -F' ' '{print $1,$2,$7,$8}'

    fi

