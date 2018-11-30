#! /bin/bash

## Wrapper script to limit CPU time

ulimit -t 20

./qconv-real.cgi "$@"
