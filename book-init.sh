#!/usr/bin/env bash
docker run -v $PWD:/srv/gitbook -v $PWD/website:/srv/html fellah/gitbook gitbook build . /srv/html --name ox-inited
