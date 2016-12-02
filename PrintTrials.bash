#!/bin/bash

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo "<!-- Must be a top level tag to include all tags to include -->"
echo "<IncludeTrials>"
echo

# create Rest trial
echo "    <Trial>"
echo "        <name>Rest</name>"
echo "        <condition>3</condition>"
echo "        <show>"
echo "            <item>PreStimCrosshair</item>"
echo "            <duration>7000</duration>"
echo "        </show>"
echo "        <show>"
echo "            <item>GetReady</show>"
echo "        </show>"
echo "    </Trial>"
echo

for oneLetter in G K F C B M Q X V R S T H J Z D
do
    for trialType in ZeroBack TwoBack
    do
        # assign condition number here
        if [[ ${trialType} == ZeroBack ]]
        then
            Condition=0
        else
            Condition=1
        fi

        #print everything out here
        echo "    <Trial>"
        echo "        <name>${trialType}_${oneLetter}</name>"
        echo "        <condition>${Condition}</condition>"
        echo "        <show>"
        echo "            <item>PreStimCrosshair</item>"
        echo "        </show>"
        echo "        <show>"
        echo "            <item>Letter_${oneLetter}</item>"
        echo "        </show>"
        echo "        <show>"
        echo "            <item>ResponseCrosshair</item>"
        echo "        </show>"
        echo "    </Trial>"
        echo
    done
done

echo "</IncludeTrials>"
