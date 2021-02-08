# cloud9 template

## Dependencies
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [vagrant-vmware-esxi](https://github.com/josenk/vagrant-vmware-esxi)
- server certificate files by [mkcert](https://github.com/FiloSottile/mkcert)

## Setup
- cloud9 server
- nginx reverse proxy for url routing and basic authentication

## Open your browser and go following url
- https://your node/cloud9     for cloud9 IDE
- https://your node/           for your app url which is redirected to http://localhost:8080/

## How to add users
- If you want to configure some users in this template, you can add c9_auth_user and c9_auth_passwd in inventories/dev/vars/c9servers.yml and edit c9servers.yml to comment out import tasks/htpasswd.yml. The task will add the specified user in nginx htpasswd.
- The authentication data should be encrypted by providing encrypt key in ~/.vaultpass and create authentication variables as follows;
```
$ echo -n <your user id> | ansible-vault encrypt_string --name c9_basic_auth_user
Reading plaintext input from stdin. (ctrl-d to end input)
!vault |
          $ANSIBLE_VAULT;1.1;AES256
	  <snipped>
$ echo -n <your password> | ansible-vault encrypt_string --name c9_basic_auth_passwd
Reading plaintext input from stdin. (ctrl-d to end input)
!vault |
          $ANSIBLE_VAULT;1.1;AES256
	  <snipped>
```

