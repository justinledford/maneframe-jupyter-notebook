#!/bin/bash
#
# This script should be executed once to setup the key pairs and copy script

USERNAME=

# Generate key pair
ssh-keygen -f ~/.ssh/mf2 -t rsa -N ''

# Copy to mf2
scp ~/.ssh/mf2 ~/.ssh/mf2.pub ${USERNAME}@m2.smu.edu:~/.ssh

# Add pair to authorized keys
ssh ${USERNAME}@m2.smu.edu 'cat ~/.ssh/mf2.pub >> ~/.ssh/authorized_keys'

# Copy jupyter notebook script to mf2
scp -i ~/.ssh/mf2 jupyter_notebook.sh ${USERNAME}@m2.smu.edu:~/scratch
