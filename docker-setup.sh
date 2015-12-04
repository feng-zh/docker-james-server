#!/bin/bash

cd /tmp

curl -L "https://repository.apache.org/service/local/artifact/maven/redirect?r=snapshots&g=org.apache.james&a=james-server-app&v=LATEST&e=tar.gz&c=app" > james-server.tar.gz

tar xf james-server.tar.gz

rm -rf james-server.tar.gz

mv james-server-app*/* ${JAMES_HOME}

cd ${JAMES_HOME}

rm bin/wrapper-linux-x86-32

sed -i 's/wrapper.daemonize=TRUE/wrapper.daemonize=FALSE/' bin/james

rm $0

