#!/bin/bash

#cat feeds/$DATE.log | egrep '(title=""|Upload)' | sed 's#.*detail/\(.*\)" title="">Got \([^<]*\)</a>.*#\1|\2#' | sed 's#.*&nbsp;\(.*\)</span>#\1#' | sed 'N;s#\n#|#' >> toreba-prizes.txt
egrep '(title=""|Upload)' feeds/* | sed 's#.*detail/\(.*\)" title="">Got \([^<]*\).*#\1|\2#' | sed 's#.*&nbsp;\(.*\)</span>.*#\1#' | sed 'N;s#\n#|#' >> toreba-prizes.txt
sort toreba-prizes.txt | uniq > toreba-prizes-daily.txt
