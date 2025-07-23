#!/bin/sh

#parec --format=S32_LE --rate=16000 -d alsa_output.pci-0000_00_1f.3.analog-stereo.monitor /home/jprajzne/test.wav &
arecord -f S32_LE -c1 -r 16000 -t wav -D default test.wav &
APID=$!

sleep 10 

echo "acrecord pid: $APID" >> /tmp/test_worked
kill $APID

whisper --language en test.wav &
WPID=$!
echo "whisper pid: $WPID:" >> /tmp/test_worked

wait $WPID
kill $WPID

grep -i "screen reader on" test.txt >> /tmp/test_worked 

