#!/bin/sh
sed -n "s/k8s-master.*host=\([^ ]*\).*/\1/p" .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
