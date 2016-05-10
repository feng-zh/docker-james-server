#!/bin/bash

cd /tmp

mkdir build

cd build

curl -L http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz > apache-maven-3.3.1-bin.tar.gz

tar -xvf apache-maven-3.3.1-bin.tar.gz

curl -L https://github.com/apache/james-project/archive/master.tar.gz > master.tar.gz

tar -xvf master.tar.gz

cd james-project-*

/tmp/build/apache-maven-3.3.1/bin/mvn package -DskipTests -Pcassandra,elasticsearch,inmemory,exclude-lucene,with-assembly,with-jetm

if [ $? -eq 0 ]; then
   cp server/app/target/james-server-app-*-app.tar.gz /tmp
fi

cd /tmp

rm -rf build

tar xf james-server-app-*-app.tar.gz

rm -rf james-server-app-*-app.tar.gz

mv james-server-app*/* ${JAMES_HOME}

cd ${JAMES_HOME}

rm bin/wrapper-linux-x86-32

sed -i 's/wrapper.daemonize=TRUE/wrapper.daemonize=FALSE/' bin/james

rm $0

