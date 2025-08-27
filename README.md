# vagrant clone templates
## how to clone generic/centos7 of vagrant cloud as ESXi cloned box
```
$ ./update_template.sh generic/centos7
ESXi hostname or IP addr: YOUR_ESXi_SERVER_NAME_or_IP_ADDR
ESXi password: 
```
- It prepares vagrant environment as generic-centos7 and add box generic/centos7.
- You can modify the cloned box as follows;
```
cd generic-centos7
vagrant ssh
# do your modification works and exit.
vagrant halt
```
## how to test cloned box
- To use cloned box, you need to add the dummy box to your vagrant box list
```
$ vagrant box add --name esxi_clone/dummy dummybox/dummy.box
```
- Test template vm
```
cd test-template
edit config.yml to provide your cloned box as "vmclone"
vagrant up
vagrant ssh
```

## ESXi vm structure
## program relation
