FROM debian:jessie
MAINTAINER yiyiwangru "308553279@qq.com"

RUN apt-get update --fix-missing && apt-get install -y python-dev libpng-dev git wget python python-pip python-virtualenv python-matplotlib

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y wget

RUN wget --no-verbose -O /tmp/apache-maven-3.6.3-bin.tar.gz https://mirrors.bfsu.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar xzf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.6.3 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.6.3-bin.tar.gz
ENV MAVEN_HOME /opt/maven

RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN cp jenkins.war /opt/jenkins.war

RUN wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.10.tar.gz 
RUN tar zxvf freetype-2.4.10.tar.gz && cd freetype-2.4.10/ && ./configure && make && make install

RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

EXPOSE 8080
CMD ["java", "-jar", "/opt/jenkins.war"]

