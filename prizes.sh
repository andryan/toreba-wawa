#!/bin/bash
#sed 's# [ABCDEFGHIJKLM]\]!!##' toreba-prizes-daily.txt | awk -F, '{print $2}' | sort | uniq -c | sort -rn | head -30
sed 's# [ABCDEFGHIJKLM]\]!!##' toreba-prizes-daily.txt | awk -F'|' '{print $2}' | sort | uniq -c | sort -rn
