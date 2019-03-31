#!/usr/bin/env bash
docker run --name ox-web -v $PWD:/website/gitbook -p 1231:80 nginx
