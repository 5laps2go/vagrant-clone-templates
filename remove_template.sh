#!/bin/bash
# name:   vagrant remove box, clone box and box environment
# usage:  remove_template.sh [box@Vagrant Cloud]
#     box should have '/' separator like 'generic/centos8'
# description:
#     It removes vagrant box, destroy template vm, and template environment
#

basebox=`echo $1|sed 's/-/\//'`            # fix the name when template provided
template=`echo $basebox | tr '/' '-'`
boximage=`echo $basebox | sed 's/\//-VAGRANTSLASH-/'`

# check if clonebox environment exist
if [ -d $template ]; then
    cd $template; vagrant destroy; cd ..
    rm -rf $template

    vagrant box remove $basebox
fi
