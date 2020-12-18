#!/bin/bash
# name:   vagrant remove box, clone box and box environment
# usage:  remove_clone.sh [box@Vagrant Cloud]
#     box should have '/' separator like 'generic/centos8'
# description:
#     It removes vagrant box, clone box, and clone box environment
#

# prepare the original box name from the cloned box directory
basebox=`echo $1|tr '-' '/'`              # fix the name when clonebox provided
clonebox=`echo $basebox | tr '/' '-'`
boximage=`echo $basebox | sed 's/\//-VAGRANTSLASH-/'`

# check if clonebox environment exist
if [ -d $clonebox ]; then
    cd $clonebox; vagrant destroy; cd ..
    rm -rf $clonebox

    vagrant box remove $basebox
fi
