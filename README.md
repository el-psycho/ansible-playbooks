# Ansible playbooks
My personal Ansible playbooks

## Running locally
Execute the following command to run locally without ssh.
This applies all roles:
```
ansible-playbook -v -K -i inventory site.yml
```

To apply only a particular role, use the following command:
```
ansible-playbook -v -K -i inventory site.yml --tags "<ROLENAME>"
```
NOTE: keep all roles tagged in their main.yml "include".
