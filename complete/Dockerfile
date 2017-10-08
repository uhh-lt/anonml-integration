FROM linuxbrew/linuxbrew

ARG user
ARG branch

USER root

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y --no-install-recommends bsdtar
RUN export tar='bsdtar'

# JAVA
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN apt-get install -y oracle-java8-installer

# MONGO DB
RUN apt-get install -y dirmngr
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update
RUN mkdir -p /data/db
RUN apt-get install -y  mongodb-org
EXPOSE 27017


# UTIL
RUN apt-get install -y git maven wget liblbfgs-dev tar build-essential




#RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
RUN git clone https://${user}@github.com/anon-ml/anonml-core.git
RUN cd anonml-core && git checkout ${branch} &&  mvn clean install -q -DskipTests



# DOC MGMT
RUN git clone https://${user}@github.com/anon-ml/anonml-document-management.git
RUN cd anonml-document-management && git checkout ${branch} &&  mvn clean install -q -DskipTests
RUN apt-get install -y poppler-utils
EXPOSE 9001

# RULE BASED
RUN git clone https://${user}@github.com/anon-ml/anonml-recognition-rulebased.git
RUN cd anonml-recognition-rulebased && git checkout ${branch}  && mvn clean install -q -DskipTests
EXPOSE 9002

# WEB
RUN git clone https://${user}@github.com/anon-ml/anonml-web.git
RUN cd anonml-web && git checkout ${branch} &&  mvn clean install -DskipTests
EXPOSE 9000



RUN echo "....."
#ML

RUN git clone --progress --verbose http://github.com/tudarmstadt-lt/GermaNER.git
RUN ls -lh
RUN cd GermaNER/germaner && mvn clean install -q -Drat.skip=true

RUN git clone --progress --verbose  https://github.com/seyyaw/cleartk.git
RUN cd cleartk && mvn clean install -Drat.skip=true -Dcleartk.skipTests=svmlight -DskipTests

USER linuxbrew
RUN brew tap homebrew/science
RUN brew install crfsuite
USER root

RUN echo "..............."
RUN git clone https://${user}@github.com/anon-ml/anonml-recognition-ml.git



RUN cd anonml-recognition-ml/service/src/main/resources/GermaNER && wget https://github.com/tudarmstadt-lt/GermaNER/releases/download/germaNER0.9.1/data.zip

RUN touch anonml-recognition-ml/service/src/main/resources/GermaNER/temp-file-to-annotate.txt
RUN cd anonml-recognition-ml && git checkout ${branch} && mvn clean install -q -DskipTests


RUN echo "Admin"
# ADMIN
RUN git clone https://${user}@github.com/anon-ml/anonml-admin.git
RUN cd anonml-admin && git checkout ${branch} && mvn clean install -q -DskipTests
EXPOSE 7000


USER root
RUN echo "copy12"
RUN mkdir model
#RUN ls -lh anonml-recognition-ml/service/src/main/resources/GermaNER/model
RUN mv anonml-recognition-ml/service/src/main/resources/GermaNER/model/model.jar model/model.jar
RUN mv anonml-recognition-ml/service/src/main/resources/GermaNER/model/feature.xml model/feature.xml
#RUN mv anonml-recognition-ml/service/src/main/resources/GermaNER/model/MANIFEST.MF model/MANIFEST.MF


USER root
EXPOSE 9003

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

EXPOSE 9900
EXPOSE 9901
EXPOSE 9902
EXPOSE 9903
EXPOSE 9333
EXPOSE 8000
RUN echo ".."
COPY start2.sh /
ENTRYPOINT /start2.sh