#!/bin/sh

#OpenRed Hat 6, 7 and 8, CentOS 6 and 7 system requirements
#Disable SELinux

# make sure SELINUX=disabled is configured
perl -pi -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux 

yum -y update ca-certificates openssl nss libcurl
#Install Java-8
#Java-8 JRE is required to run PiServer. In order to help troubleshooting problems that might #be related with PiServer, Java-8 JDK is recommended.

#Both Oracle Java and OpenJDK are supported.

#For Oracle Java packages, please check https://www.oracle.com/technetwork/java/javase/#downloads/index.html. For example,

#wget --no-check-certificate --no-cookies \
#     --header "Cookie: oraclelicense=accept-securebackup-cookie" \ 
#     http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

#For OpenJDK, please install java-1.8.0-openjdk_headless package that comes with the OS.
rpm -q java-1.8.0-openjdk-headless || yum install java-1.8.0-openjdk-headless

# To verify Java program version, run command
# should return 'openjdk version "1.8.0_xxx"'.
java -version
# since /etc/sysconfig/selinux is modified 
# reboot 
