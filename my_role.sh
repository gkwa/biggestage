#!/usr/bin/env bash

set -e


# https://ansible.readthedocs.io/projects/molecule/getting-started/
basedir=$(pwd)
mkdir -p $basedir/collections/ansible_collections
cd $basedir/collections/ansible_collections
ansible-galaxy collection init foo.bar

collection=$basedir/collections/ansible_collections/foo/bar

cd $collection/roles

ansible-galaxy role init my_role

cat >$collection/roles/my_role/tasks/main.yml <<EOF
---
- name: Task is running from within the role
  ansible.builtin.debug:
    msg: "This is a task from my_role."
EOF

cd $collection
mkdir -p playbooks

cat > playbooks/my_playbook.yml <<EOF
---
- name: Test new role from within this playbook
  hosts: localhost
  gather_facts: false
  tasks:
    - name: Testing role
      ansible.builtin.include_role:
        name: foo.bar.my_role
        tasks_from: main.yml
EOF




mkdir -p $collection/extensions
cd $collection/extensions

molecule init scenario

cd $collection/extensions
molecule test