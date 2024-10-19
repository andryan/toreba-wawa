#!/bin/bash

TAIL=`tail -1 toreba-prizes-daily.txt | awk -F, '{print $1}'`
HEAD=`head -1 toreba-prizes-daily.txt | awk -F, '{print $1}'`
WC=`wc -l toreba-prizes-daily.txt | awk '{print $1}'`

ATTEMPTS=$((TAIL-HEAD))
echo $ATTEMPTS $WC `bc <<< "scale=1; $ATTEMPTS/$WC"`
