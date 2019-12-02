#!/bin/sh

osx_num=$(sw_vers -productVersion | awk -F '[.]' '{print $2}')

OSX_MARKETING=(
   ['14']='Mojave'
   ['15']='Catalina'
)

# 代码名称
readonly CODENAME=${OSX_MARKETING[$osx_num]}
