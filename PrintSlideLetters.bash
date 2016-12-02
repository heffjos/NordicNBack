#!/bin/bash

for oneLetter in G K F C B M Q X V R S T H J Z D
do
    echo "    <Slide>"
    echo "        <name>Letter_${oneLetter}</name>"
    echo "        <text>${oneLetter}</text>"
    echo "        <font>Arial</font>"
    echo "        <fontsize>72</fontsize>"
    echo "        <duration>500</duration>"
    echo "        <expectedResponse>"
    echo "            <key>C</key>"
    echo "            <count>1</count>"
    echo "        </expectedResponse>"
    echo "    </Slide>"
    echo
done
