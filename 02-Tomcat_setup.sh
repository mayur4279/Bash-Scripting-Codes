#!/bin/bash
sudo yum install git -y
sudo yum install java -y  

sudo git clone https://github.com/mayur4279/tmp /opt/tmp

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.zip -P /opt
sudo unzip /opt/apache-tomcat-9.0.89.zip -d /opt

sudo cp -rvf /opt/tmp/student.war /opt/apache-tomcat-9.0.89/webapps

sudo cp -rvf /opt/tmp/mysql-connector.jar /opt/apache-tomcat-9.0.89/lib

sudo chmod +x /opt/apache-tomcat-9.0.89/bin/catalina.sh
 
sudo  rm -rvf  /opt/tmp   
sudo  rm -rvf  /opt/apache-tomcat-9.0.89.zip 
 
# Start Tomcat
sudo bash /opt/apache-tomcat-9.0.89/bin/catalina.sh start


