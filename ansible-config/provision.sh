#!/bin/zsh

# Use Python3 provided in MacOS for Ansible
python3 -m venv venv
source venv/bin/activate
pip install ansible

# Main playbook contains sequential run of all playbooks
ansible-playbook main.yml
