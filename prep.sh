#!/bin/bash

#/Gathering Variables\
echo ("What is the full name of your modpack directory?")
read modpack

echo ("How much ram do you want allocated to this server? Add G for gigabyte and M for megabyte")
read ram
if [[$ram = "G" || $ram = "M" ]]; then
    echo "Ram sucessfully added!"
else 
    echo "G or M not detected..."
    return 1 
fi  



echo ("Creating start.sh.....")
touch start.sh

echo ("start.sh created! adding ram and optimal java arguments...")
echo "-XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+AlwaysActAsServerClassMachine -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:NmethodSweepActivity=1 -XX:ReservedCodeCacheSize=400M -XX:NonNMethodCodeHeapSize=12M -XX:ProfiledCodeHeapSize=194M -XX:NonProfiledCodeHeapSize=194M -XX:-DontCompileHugeMethods -XX:MaxNodeLimit=240000 -XX:NodeLimitFudgeFactor=8000 -XX:+UseVectorCmov -XX:+PerfDisableSharedMem -XX:+UseFastUnorderedTimeStamps -XX:+UseCriticalJavaThreadPriority -XX:ThreadPriorityPolicy=1 -Xms"$ram"Xmx"$ram >> start.sh

echo ("Java argumenmts added.. making start.sh runable and adding it to modpack...")
chmod 777 start.sh
mv start.sh $modpack



