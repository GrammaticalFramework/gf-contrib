#! /bin/bash

## Wrapper script to limit CPU time

ulimit -t 40

./qconv-real.cgi "$@"
