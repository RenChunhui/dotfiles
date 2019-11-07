#!/bin/sh

base_ver=10.14
ver=$(sw_vers | grep ProductVersion | cut -d':' -f2 | tr -d ' ')
if [ $ver == $base_ver ]
then
   echo "older"
else
   echo "newer"
fi

echo $ver
echo $base_ver
