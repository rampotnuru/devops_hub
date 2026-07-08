#!/bin/bash

sudo yum update -y
sudo yum install java-21-amazon-corretto-devel -y

java --version

cd /opt

sudo wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.24/bin/apache-tomcat-11.0.24.tar.gz

sudo tar -xvzf apache-tomcat-11.0.24.tar.gz

sudo mv apache-tomcat-11.0.24 tomcat

sudo chmod +x /opt/tomcat/bin/*.sh

sudo /opt/tomcat/bin/startup.sh

echo "Tomcat installation completed."
