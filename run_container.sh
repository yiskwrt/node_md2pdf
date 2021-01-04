#!/bin/bash
docker run --rm -it -v `pwd`:/workspace node_md2pdf conv $*
