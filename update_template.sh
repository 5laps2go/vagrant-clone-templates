#!/bin/bash
# name:   vagrant preparation for vagrant template environment of esxi
# usage:  update_template.sh [box@Vagrant Cloud]
#     box should have '/' separator like 'generic/centos8'
# description:
#     It creates and update vagrant template environment for template vm, 
#     whose name has the separator '-' instead of '/' of the specified box.
#

basebox=$1
# verify whether the box is in Vagrant Cloud
baseboxurl_id=`echo $basebox|sed -e 's/\//\/box\//'`
baseboxurl="https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/$baseboxurl_id/versions"
boxversion=`curl $baseboxurl 2>/dev/null|jq -e -r .versions[0].name`
if [ $? -ne 0 ]; then
   echo "no box found in the Vagrant Cloud"
   exit 1;
fi

template=`echo $basebox | tr '/' '-'`
boximage=`echo $basebox | sed 's/\//-VAGRANTSLASH-/'`

# prepare directory for vagrant environment
mkdir -p $template
pushd $template >/dev/null

# prepare vagrant configuration files: Vagrantfile and config.yml
if [ ! -f Vagrantfile ]; then
    if ! vagrant init>/dev/null; then
	echo "vagrant needs to be installed!!"
	exit 1;
    fi

    read -p "ESXi hostname or IP addr: " esxi
    #read -sp "ESXi password: " passwd
    #echo ""

    sed -e "s;\$template;$template;" -e "s;\$basebox;$basebox;" -e "s;\$boxversion;$boxversion;" ../Vagrantfile.j2 > Vagrantfile
    sed -e "s;\$esxi;$esxi;" -e "s;\$passwd;$passwd;" ../config.yml.j2 > config.yml
fi

# remove the previous template vm from esxi
vagrant destroy >/dev/null

# remove the previous vagrant box
vagrant box remove $basebox >/dev/null

# download the latest vagrant box
vagrant up

# halt the clone image
vagrant halt

# remove esxi image from the box to slim the local disk
find ~/.vagrant.d/boxes/$boximage -name '*.vmdk' -exec rm '{}' \;

popd >/dev/null
