#!/bin/bash
#revision :001$
#$Mon April 3 11:44:55 IST 2023$

#VARIABLES
BASE=C:\Users\vansh\Downloads
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not
if [! -d $BASE]
then
    echo "directory does not exist: $BASH"
    exit 1
fi
#Create archive folder is not present
if [! -d $BASE/archive]
then
    mkdir $BASE/archive
fi
#Find the list of files larger than 20 mb
for i in 'find $BASE  -maxdepth $DEPTH -type f -size+20M'

do
      if[$RUN -eq 0]
      then 
            echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
            gzip $i || exit 1
            mv $i.gz $BASE/archive || exit 1
      fi
done
