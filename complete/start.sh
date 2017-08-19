#!/usr/bin/env bash
mongod&
sleep 30
java -Xmx4096m -Djava.security.egd=file:/dev/./urandom -jar anonml-recognition-ml/service/target/recognition-machinelearning-service-0.0.1-SNAPSHOT.jar &
sleep 100
java -Djava.security.egd=file:/dev/./urandom -jar anonml-admin/target/admin-0.0.1-SNAPSHOT.jar  &
sleep 30
java -Djava.security.egd=file:/dev/./urandom -jar anonml-document-management/service/target/document-management-service-0.0.1-SNAPSHOT.jar &
sleep 30
java -Djava.security.egd=file:/dev/./urandom -jar anonml-web/target/web-0.0.1-SNAPSHOT.jar   &
sleep 30
java -Djava.security.egd=file:/dev/./urandom -jar anonml-recognition-rulebased/service/target/recognition-rulebased-service-0.0.1-SNAPSHOT.jar


