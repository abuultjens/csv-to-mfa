#!/bin/bash

#-----------------------------------------------------------------------

IN=345_INDELS.csv
OUT=345_INDELS.aln

#-----------------------------------------------------------------------

# generate random prefix for all tmp files
RAND_1=`echo $((1 + RANDOM % 100))`
RAND_2=`echo $((100 + RANDOM % 200))`
RAND_3=`echo $((200 + RANDOM % 300))`
RAND=`echo "${RAND_1}${RAND_2}${RAND_3}"`

# check for and rm any preexisting files
if ls ${OUT} 1> /dev/null 2>&1; then
        rm ${OUT}
fi

# make fofn
head -1 ${IN} | tr ',' '\n' | tail -n +2 > ${RAND}_fofn.txt

# tr matrix
tr ',' '\t' < ${IN} | datamash transpose -H | tr '\t' ',' > ${RAND}_tmp.tr.csv

# write fa blocks
for TAXA in $(cat ${RAND}_fofn.txt); do

	SEQ=`grep $"${TAXA}," ${RAND}_tmp.tr.csv | cut -f 2- -d ',' | tr -d ',' | tr '0' 'A' | tr '1' 'T'`
	
	echo ">${TAXA}" >> ${OUT}
	echo "${SEQ}" >> ${OUT}

done

# rm tmp files
rm ${RAND}_tmp.tr.csv		
rm ${RAND}_fofn.txt
