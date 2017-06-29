#!/usr/bin/env bash
mongod&
java -Djava.security.egd=file:/dev/./urandom -jar /anonml-document-management/target/docmgmt-0.0.1-SNAPSHOT.jar  &
java -Djava.security.egd=file:/dev/./urandom -jar /anonml-web/target/web-0.0.1-SNAPSHOT.jar   &
java -Djava.security.egd=file:/dev/./urandom -jar /anonml-recognition-rulebased/target/recognition-rulebased-0.0.1-SNAPSHOT.jar
