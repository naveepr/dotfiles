#!/bin/bash

set -x

rm -f cscope.files
rm -f tags
rm -f cscope.out

function find_all_files {
  list_of_all_file_extensions=$(find * | awk -F"/" '{print $NF}' | grep -ai "\." | awk -F"." '{print $NF}' | sort | uniq)
  for x in $list_of_all_file_extensions
  do
    echo "find . -name '*.${x}' -print >> cscope.files"
  done
}

function find_sources {
find ${SRC_DIR} -name '*.cc' -print >> cscope.files
find ${SRC_DIR} -name '*.c' -print >> cscope.files
find ${SRC_DIR} -name '*.h' -print >> cscope.files
find . -name 'Makefile' -print >> cscope.files
find . -name 'CMakeLists.txt' -print >> cscope.files
}

SRC_DIR="src/"

if [ "$1" == "all" ]
then
  echo "Running over PWD"
  SRC_DIR=.
fi

find_sources
cscope -b
ctags -L cscope.files
rm -f cscope.files
