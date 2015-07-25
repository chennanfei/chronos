FROM ubuntu:14.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN echo "deb http://repos.mesosphere.io/ubuntu trusty main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list

ENV MESOS_NATIVE_JAVA_LIBRARY /usr/local/lib/libmesos.so
ENV CHRONOS_VERSION 2.3.4
RUN apt-get update && apt-get install -y openjdk-7-jre-headless node mesos chronos
