#!/bin/bash
export MAVEN_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$SCALA_HOME/bin
rm /usr/local/web/webapps/oil-web.war
rm -rf /usr/local/web/webapps/oil-web
cd /dna-om/om-oil/om-oil-web/
mvn package -DskipTests
JPDA_ADDRESS=9000 JPDA_TRANSPORT=dt_socket /usr/local/web/bin/catalina.sh jpda stop
cp /dna-om/om-oil/om-oil-web/target/oil-web.war /usr/local/web/webapps/
JPDA_ADDRESS=9000 JPDA_TRANSPORT=dt_socket /usr/local/web/bin/catalina.sh jpda start
