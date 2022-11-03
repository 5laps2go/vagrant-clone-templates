# microk8s node template provision

## microk8s configuration
The configuration is defined by config.yml as nodes structure as follows;
```
nodes:
  - type: "microk8s-node"
    hostname: "k8s-node"
    cpus: 1
    memory: 1024
    disk_type: "thin"
```

## kubectl from local machine
- install kubectl
```
$ sudo snap install kubectl --classic # for ubuntu
$ sudo yum install kubernetes-client  # for centos7
```
- configure master information by
```
$ mkdir ~/.kube
$ vagrant ssh k8-master -c "microk8s config" > ~/.kube/config
```
- kubectl version --client
