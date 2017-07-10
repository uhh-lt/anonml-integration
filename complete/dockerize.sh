#!/usr/bin/env bash
docker build . -t complete &&
docker run -p 9000:9000 -p 9001:9001 -p 9002:9002 -p 9003:9003 -p 27071:77071 complete