#!/bin/bash

################################################################
#Poll for ip changes and post the ip to your email
#
#Can be run in crontab without while loop
#*/5 * * * * /home/adam/script.sh will execute script.sh every 5 minutes.
################################################################

oldip=""
newip=""
email=$1

while [ 1 ]
do
	wget http://automation.whatismyip.com/n09230945.asp -O /tmp/tmp_ipout.txt -o /dev/null
	newip=`cat /tmp/tmp_ipout.txt`
	if [ "$oldip" != "$newip" ];
	then
		echo "Mailing new ip '$newip'"
		echo "test" | mail -s "$newip" $email
	fi
	oldip=$newip
	sleep 2000
done
