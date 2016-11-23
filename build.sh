#!/bin/bash
INAME="mandic/php"
FLAVORS="5.4-fpm/coffe 5.6-fpm/peach"
mkdir -p logs
for F in $FLAVORS; do
	T=${F/\//\-}
	echo -n "Building ${INAME}:${T}... "
	CONTAINER=$(docker build --no-cache --rm -t ${INAME}:$T $F > logs/$T.log 2>&1)
	echo $CONTAINER
done