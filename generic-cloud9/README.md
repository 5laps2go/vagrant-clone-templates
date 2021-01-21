# cloud9 template

## configuration
- cloud9 server
- nginx reverse proxy for url routing and basic authentication

## service url
- https://your node/cloud9     for cloud9 IDE
- https://your node/           for your app url which is redirected to http://localhost:8080/

## basic authentication
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

