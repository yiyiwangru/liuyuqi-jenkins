FROM debian:jessie
MAINTAINER liuyuqi "juhongxiaoshou@163.com"

RUN apt-get update --fix-missing && apt-get install -y python-dev libpng-dev git wget python python-pip python-virtualenv python-matplotlib
RUN apt-get install -y openjdk-7-jre-headless
RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
RUN cp jenkins.war /opt/jenkins.war
RUN wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.10.tar.gz 
RUN tar zxvf freetype-2.4.10.tar.gz && cd freetype-2.4.10/ && ./configure && make && make install
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

EXPOSE 8080
CMD ["java", "-jar", "/opt/jenkins.war"]

