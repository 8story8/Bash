#!/bin/sh

# resolve links - $0 may be a softlink
PRG="$0"

if [ -z "$directory" ];then
  while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
      PRG="$link"
    else
      PRG=`dirname "$PRG"`/"$link"
    fi
  done

  cd $(dirname $PRG)
  export directory=`pwd`
  cd -&>/dev/null
fi

cat=$(cat $directory/myfile | grep "mystring")
echo "cat : $cat"

grep=$(grep "mystring" $directory/myfile)
echo "grep : $grep"

