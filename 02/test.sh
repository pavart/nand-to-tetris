#!/bin/bash
GOOD_RESULT="End of script - Comparison ended successfully"
FAILED=0

for i in $(find ./02 -name '*.tst' | sort); do

    SIMULATION_RESULT=$(sh tools/HardwareSimulator.sh $i;)
    if [[ "$SIMULATION_RESULT" == "$GOOD_RESULT" ]];
    then
        echo "$i - tests passed"
    else
        echo "$i - tests failed"
        FAILED=1
   fi

done

if [[ "$FAILED" == "1" ]];
then
    echo "Tests failed!";
    exit 1;
else
    echo "Tests passed"
fi