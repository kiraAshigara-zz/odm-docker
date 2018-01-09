#!/bin/bash
export MAVEN_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$SCALA_HOME/bin
JPDA_ADDRESS=9001 JPDA_TRANSPORT=dt_socket /usr/local/web/bin/catalina.sh jpda stop
JPDA_ADDRESS=9001 JPDA_TRANSPORT=dt_socket /usr/local/web/bin/catalina.sh jpda start
echo "web: http://localhost.integrichain.com:8081/oil-web/ and debug port 9001"
