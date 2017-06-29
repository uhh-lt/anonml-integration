#!/usr/bin/env bash
docker build . -t doc-regex-web &&
docker run -p 9000:9000 -p 9001:9001 -p 9002:9002 -p 27071:77071 doc-regex-web