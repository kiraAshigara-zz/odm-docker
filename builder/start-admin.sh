#!/bin/bash
export MAVEN_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$SCALA_HOME/bin
JPDA_ADDRESS=9000 JPDA_TRANSPORT=dt_socket /usr/local/admin/bin/catalina.sh jpda stop
JPDA_ADDRESS=9000 JPDA_TRANSPORT=dt_socket /usr/local/admin/bin/catalina.sh jpda start
echo "admin:http://localhost:8080 and debug port 9000"
