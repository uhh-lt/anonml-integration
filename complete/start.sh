#!/usr/bin/env bash
echo "Starting MongoDB"
mongod&
sleep 30
java -Xmx4096m -Djava.security.egd=file:/dev/./urandom -jar anonml-recognition-ml/target/recognition-ml-0.0.1-SNAPSHOT.jar
sleep 30
java -Djava.security.egd=file:/dev/./urandom -jar anonml-document-management/target/docmgmt-0.0.1-SNAPSHOT.jar  &
sleep 30
java -Djava.security.egd=file:/dev/./urandom -jar anonml-web/target/web-0.0.1-SNAPSHOT.jar   &
sleep 30
java -Djava.security.egd=file:/dev/./urandom -jar anonml-recognition-rulebased/target/recognition-rulebased-0.0.1-SNAPSHOT.jar &


