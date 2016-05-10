#!/bin/bash

cd /tmp

# curl -L "https://repository.apache.org/service/local/artifact/maven/redirect?r=snapshots&g=org.apache.james&a=james-server-app&v=LATEST&e=tar.gz&c=app" > james-server.tar.gz
curl -L "http://repo.maven.apache.org/maven2/org/apache/james/apache-james/3.0-beta4/apache-james-3.0-beta4-app.tar.gz" > james-server.tar.gz

tar xf james-server.tar.gz

rm -rf james-server.tar.gz

# mv james-server-app*/* ${JAMES_HOME}
mv apache-james*/* ${JAMES_HOME}

cd ${JAMES_HOME}

rm bin/wrapper-linux-x86-32

sed -i 's/wrapper.daemonize=TRUE/wrapper.daemonize=FALSE/' bin/james

rm $0

