#!/usr/bin/env bash
docker run --rm -v "$OXB" -p 1231:4000 billryan/gitbook gitbook serve
