#!/bin/sh

catalina=10.15

version=$(sw_vers | grep ProductVersion | cut -d':' -f2 | tr -d ' ')

if [ $version == $catalina ]
then
   echo "older"
else
   echo "newer"
fi

echo $version
echo $catalina
