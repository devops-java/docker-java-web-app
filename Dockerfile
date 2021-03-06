FROM ubuntu:16.04
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y curl && apt-get update && apt-get install -y iputils-ping
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.54/* /usr/local/tomcat/
EXPOSE 8080
ADD target/app.war /usr/local/tomcat/webapps/
CMD /usr/local/tomcat/bin/catalina.sh run
