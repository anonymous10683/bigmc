#!/bin/sh

TARG="gdpe@expdev.net:/home/gdpe/public_html/bigraph/bigmc"

git pull origin master
./autogen.sh
./configure

make pdf

if [ $? -ne 0 ]
then
	echo "make pdf failed, aborting."
	exit 1
fi

make html

if [ $? -ne 0 ]
then
	echo "make html failed, aborting."
        exit 1
fi

make dist
if [ $? -ne 0 ]
then
	echo "make dist failed, aborting."
        exit 1
fi

echo "scp doc/manual/bigmc.pdf $TARG/bigmc.pdf"
echo "scp doc/manual/bigmc.html/* $TARG/manual/"
echo "scp bigmc-0.1.tar.gz $TARG/release/"


