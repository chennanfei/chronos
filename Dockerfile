FROM ubuntu:14.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN echo "deb http://repos.mesosphere.io/ubuntu trusty main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list

RUN apt-get update && apt-get install -y openjdk-7-jre-headless mesos git maven2

ENV MESOS_NATIVE_JAVA_LIBRARY /usr/local/lib/libmesos.so
ENV CHRONOS_VERSION 2.3.4

RUN mkdir chronos
WORKDIR /chronos

RUN git clone https://github.com/mesos/chronos.git /chronos
RUN mvn clean pakcage
RUN cp target/chronos.jar /
RUN rm -rf /chronos/*
RUN apt-get remove git maven2

COPY chronos_run.sh /
RUN chmod +x /chronos_run.sh

EXPOSE 8080
CMD ["/chronos_run.sh"]
