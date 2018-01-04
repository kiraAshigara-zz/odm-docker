From debian:jessie
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN apt-get -y install wget
RUN wget http://dev.mysql.com/get/mysql-apt-config_0.7.3-1_all.deb
RUN apt-get -y install lsb-release
RUN apt-get -y install vim
RUN DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.7.3-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get --force-yes -y install mysql-server
COPY mysql.cnf /etc/mysql/mysql.cnf
COPY jdk-7u80-linux-x64.tar.gz /jdk-7u80-linux-x64.tar.gz
COPY apache-tomcat-7.0.82.tar.gz /apache-tomcat-7.0.82.tar.gz
COPY start.bash /start.bash
COPY scala-tool-support-2.10.1.tgz /scala-tool-support-2.10.1.tgz
COPY apache-maven-3.5.2-bin.tar.gz /apache-maven-3.5.2-bin.tar.gz
RUN chmod a+x start.bash
RUN tar -xvzf jdk-7u80-linux-x64.tar.gz
RUN tar -xvzf apache-tomcat-7.0.82.tar.gz
RUN tar -xvzf apache-maven-3.5.2-bin.tar.gz
RUN tar -xvzf scala-tool-support-2.10.1.tgz
RUN cp -r apache-tomcat-7.0.82 /usr/local/admin
RUN cp -r apache-tomcat-7.0.82 /usr/local/web
COPY web-server.xml /usr/local/web/conf/server.xml
COPY admin-server.xml /usr/local/admin/conf/server.xml
RUN mv jdk1.7.0_80/ /usr/local/java
RUN mv scala-tool-support-2.10.1 /usr/local/scala
RUN mv apache-maven-3.5.2/ /usr/local/maven
COPY setup_user.sql /setup_user.sql
EXPOSE 3306 8080 8081
CMD ./start.bash
