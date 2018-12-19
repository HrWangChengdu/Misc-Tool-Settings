#!/bin/bash

if mvn -version &> /dev/null; then
    echo "mvn installed"
    exit
fi

wget http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
tar xvf apache-maven-3.0.5-bin.tar.gz
sudo mv apache-maven-3.0.5  /usr/local/apache-maven

echo "export M2_HOME=/usr/local/apache-maven" >> ~/.bashrc
echo "export M2=\$M2_HOME/bin" >> ~/.bashrc
echo "export PATH=\$M2:\$PATH" >> ~/.bashrc

source ~/.bashrc
echo "show mvn info"
mvn -version
