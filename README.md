# vagrant clone templates
## how to clone generic/centos7 of vagrant cloud as ESXi cloned box
```
./update_clone generic/centos7
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
```
cd test-template
edit config.yml to provide your cloned box as "vmclone"
vagrant up
vagrant ssh
```
## ESXi vm structure
## program relation
