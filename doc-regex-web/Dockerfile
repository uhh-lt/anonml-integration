FROM ubuntu:16.04

ARG user

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y dirmngr
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update
RUN mkdir -p /data/db
RUN apt-get install -y mongodb-org
RUN apt-get install -y poppler-utils
RUN apt-get install -y git
RUN apt-get install -y maven

RUN mkdir code
RUN cd code

RUN apt-get install -y openjdk-8-jdk
#RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN git clone https://${user}@github.com/anon-ml/anonml-core.git
RUN cd anonml-core && mvn clean install -DskipTests && cd ..

RUN git clone https://${user}@github.com/anon-ml/anonml-document-management.git
RUN cd anonml-document-management && mvn clean install -DskipTests && cd ..

RUN git clone https://${user}@github.com/anon-ml/anonml-recognition-rulebased.git
RUN cd anonml-recognition-rulebased && mvn clean install -DskipTests && cd ..

RUN git clone https://${user}@github.com/anon-ml/anonml-web.git
RUN cd anonml-web && mvn clean install -DskipTests && cd ..

EXPOSE 27017
EXPOSE 9000
EXPOSE 9001
EXPOSE 9002


COPY start.sh /
ENTRYPOINT /start.sh