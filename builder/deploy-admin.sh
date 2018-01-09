#!/bin/bash
export MAVEN_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$SCALA_HOME/bin
rm /usr/local/admin/webapps/oms-admin.war
rm -rf /usr/local/admin/webapps/oms-admin
cd /dna-om/om-oil/om-oil-admin/
mvn package -DskipTests
JPDA_ADDRESS=9000 JPDA_TRANSPORT=dt_socket /usr/local/admin/bin/catalina.sh jpda stop
cp /dna-om/om-oil/om-oil-admin/target/oil-admin.war /usr/local/admin/webapps/oms-admin.war
JPDA_ADDRESS=9000 JPDA_TRANSPORT=dt_socket /usr/local/admin/bin/catalina.sh jpda start
