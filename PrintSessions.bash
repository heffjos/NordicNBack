#!/bin/bash

Run=$1
DesignFile=/home/heffjos/Documents/Tasks/Nordic/NBack/Design.csv

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo "<!-- Must be a top level tag to include all tags to include -->"
echo "<IncludeSessions>"
echo "    <Session>"
echo "        <name>NBack</name>"

# start with intro slides
echo "        <runtrial>Disdaq</runtrial>"
echo "        <runtrial>Instructions1Trial</runtrial>"
echo "        <runtrial>Instructions2Trial</runtrial>"

PreviousType=""
for Line in `grep -E ^${Run} ${DesignFile}`
do
    TrialType=`echo ${Line} | awk -F, '{print $3}'`
    Letter=`echo ${Line} | awk -F, '{print $5}'`

    if [[ ${TrialType} != Rest ]]
    then
        if [[ ${TrialType} != ${PreviousType} ]]
        then
            echo "        <runtrial>Instructions${TrialType}Trial</runtrial>"
            PreviousType=${TrialType}
        fi

        echo "        <runtrial>${TrialType}_${Letter}</runtrial>"
    else
        echo "        <runtrial>Rest</runtrial>"
        PreviousType=Rest
    fi
done

echo "    </Session>"
echo "</IncludeSessions>"
