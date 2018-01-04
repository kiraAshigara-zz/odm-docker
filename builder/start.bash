#!/bin/bash
export MAVEN_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$SCALA_HOME/bin
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
service mysql start
mkdir -p /var/data/OUT
mkdir -p /var/data/historical
mkdir -p /var/data/IN/order850_rt
mkdir -p /var/data/IN/order850_history
mkdir -p /var/data/process/order850_rt
mkdir -p /var/data/process/order850_history
mkdir -p /var/data/config
mysql -u root < setup_user.sql
cd /dna-om/
echo "***** compiling *****"
mvn install -DskipTests
mvn package -DskipTests
echo "***** update database *****"
mvn process-sources -Pupdate-database
echo "***** update database *****"
cp /dna-om/om-oil/om-oil-admin/target/oil-admin.war /usr/local/admin/webapps/oms-admin.war
cp /dna-om/om-oil/om-oil-web/target/oil-web.war /usr/local/web/webapps/
echo "192.168.4.106 b-devtstsrvr" > /etc/hosts
/usr/local/web/bin/catalina.sh start
/usr/local/admin/bin/catalina.sh run
