FROM centos
MAINTAINER Mathew Thomas

RUN yum install -y java-1.8.0-openjdk-devel

COPY target/quote-service-docker-0.1.0.jar .

EXPOSE :8080
 
CMD java -jar quote-service-docker-0.1.0.jar
