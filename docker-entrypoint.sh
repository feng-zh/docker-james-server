#!/bin/bash

if [ -e /etc/james-server ]; then

  for f in /etc/james-server/*; do
    test -f "$f" && cp $f conf/
  done

  if [ -e /etc/james-server/lib ]; then

    for f in /etc/james-server/lib/*; do
      test -f "$f" && cp $f conf/lib
    done

  fi

fi

bin/james start

