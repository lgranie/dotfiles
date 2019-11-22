#!/bin/sh

TORRENT="$1"

if [ -z "${TORRENT}"]; then 
  TORRENT = $QUERY_STRING
fi

transmission-remote -l
if [ $? -eq 1 ]; then
  transmission-daemon
  sleep 2
fi

transmission-remote --add ${TORRENT}

