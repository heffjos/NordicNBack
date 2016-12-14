#!/bin/bash

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo "<!-- Must be a top level tag to include all tags to include -->"
echo "<IncludeTrials>"
echo

# create instruction trials; this is for display in sessions
echo "    <Trial>"
echo "        <name>Instructions1Trial</name>"
echo "        <show>"
echo "            <item>Instructions1</item>"
echo "        </show>"
echo "    </Trial>"
echo
echo "    <Trial>"
echo "        <name>Instructions2Trial</name>"
echo "        <show>"
echo "            <item>Instructions2</item>"
echo "        </show>"
echo "    </Trial>"
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
echo "            <item>GetReady</item>"
echo "        </show>"
echo "    </Trial>"
echo

# creat disdaq trial
echo "    <Trial>"
echo "        <name>Disdaq</name>"
echo "        <show>"
echo "            <item>PreStimCrosshair</item>"
echo "            <duration>5000</duration>"
echo "        </show>"
echo "    </Trial>"
echo

# create ZeroBack and TwoBack instruction trials
echo "    <Trial>"
echo "        <name>InstructionsZeroBackTrial</name>"
echo "        <show>"
echo "            <item>InstructionsZeroBack</item>"
echo "        </show>"
echo "    </Trial>"
echo
echo "    <Trial>"
echo "        <name>InstructionsTwoBackTrial</name>"
echo "        <show>"
echo "            <item>InstructionsTwoBack</item>"
echo "        </show>"
echo "    </Trial>"
echo

# create goodbye trial
echo "    <Trial>"
echo "        <name>GoodybyeTrial</name>"
echo "        <show>"
echo "            <item>Goodbye</item>"
echo "        </show>"
echo "    </Trial>"

for oneLetter in G K F C B M Q X V R S T H J Z D
do
    for trialType in ZeroBack TwoBack
    do
        # assign condition number here
        if [[ ${trialType} == ZeroBack ]]
        then
            Condition=1
        else
            Condition=2
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
