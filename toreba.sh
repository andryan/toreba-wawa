#!/bin/bash

DATE=`date +%Y%m%d%H%M%S`
#INTERFACE=`shuf -i62-69 -n1`
#echo $INTERFACE > last-ip
LASTIP=`cat last-ip`
if [ $LASTIP -eq 69 ]; then
  INTERFACE=63
else
  INTERFACE=$((LASTIP+1));
fi
echo $INTERFACE > last-ip

echo "$DATE $INTERFACE" >> feeds/interface.log
curl --interface 115.166.97.1$INTERFACE -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36" -s -H "Accept-Language: en-US,en;q=0.9,id;q=0.8" 'http://www.toreba.net/replay' > feeds/$DATE.log
cat toreba-prizes-daily.txt > toreba-prizes.txt
#cat feeds/$DATE.log | egrep '(title=""|Upload)' | sed 's#.*detail/\(.*\)" title="">Got \([^<]*\)</a>.*#\1|\2#' | sed 's#.*&nbsp;\(.*\)</span>#\1#' | sed 'N;s#\n#|#' >> toreba-prizes.txt
cat feeds/$DATE.log | egrep '(title=""|Upload)' | sed 's#.*detail/\(.*\)" title="">Got \([^<]*\).*#\1|\2#' | sed 's#.*&nbsp;\(.*\)</span>.*#\1#' | sed 'N;s#\n#|#' >> toreba-prizes.txt
sort toreba-prizes.txt | uniq > toreba-prizes-daily.txt
