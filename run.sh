#!/bin/bash

SCRIPTDIR=`dirname $0`/scripts
TMPFILE=/tmp/jupi-monitoring
TARGETS="prauscher@prauscher.homeip.net hostmaster+jupimonitoring@unionhost.de"

[ -e $TMPFILE ] && mv $TMPFILE ${TMPFILE}~

for i in $SCRIPTDIR/*; do
	[ -x $i ] && $i
done > $TMPFILE

generateMail() {
	echo "To: $1"
	echo "From: Junge Piraten Monitoring <monitoring@junge-piraten.de>"
	echo "Subject: ALERT [`date`]"
	echo
	diff ${TMPFILE}~ $TMPFILE
	echo "----------------------------------------------------------------------"
	cat $TMPFILE
}

if [ -e ${TMPFILE}~ ]; then
	diff ${TMPFILE}~ $TMPFILE > /dev/null || {
		for i in $TARGETS; do
			generateMail $i | sendmail $i
		done
	}
fi
