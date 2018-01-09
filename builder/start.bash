#!/bin/bash
export MAVEN_HOME=/usr/local/maven
export SCALA_HOME=/usr/local/scala
export JAVA_HOME=/usr/local/java
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$SCALA_HOME/bin
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
FILE=/done.txt
if [ -f $FILE ]; then
   /start-services.sh
   sleep infinity
fi
/start-database.sh
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
/start-web.sh
/start-admin.sh
echo "done" > /done.txt
sleep infinity
