#!/bin/bash

START=201804220000
STOP=201804221007

for i in `seq $START $STOP`;
do
  cp ../$i* feeds/
done
