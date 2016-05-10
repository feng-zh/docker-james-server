Introduction
-----
This is the docker project to setup apache james server (Java Mail Server).


Install
-----
### Simple Run
```
docker run --name james-server -p 25:25 fengzhou/james-server
```

### Customize Configuration File
```
# suppose configuration file is located in 'etc' sub folder.
docker run --name james-server -p 25:25 -v $(pwd)/etc:/etc/james-server fengzhou/james-server:3.0-beta4
```

The james server configuration can refer to http://james.apache.org/server/3/config.html

