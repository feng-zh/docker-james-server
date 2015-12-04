#!/bin/bash

if [ -e /etc/james-server ]; then
  for f in /etc/james-server/*; do
    test -f "$f" && cp $f conf/
  done
fi

bin/james start

