#!/bin/bash

USERNAME=jledford

echo "Launching jupyter notebook..."

rm -f .mfnb.env

ssh mf2 'bash -s' > .mfnb.env < start_job.sh &

# Wait until env file created
while true; do
    if [ -s .mfnb.env ]; then
        break
    fi
    sleep 1
done

source .mfnb.env

# forward to login node
ssh -L $NB_PORT:localhost:$NB_PORT \
       ${USERNAME}@${NB_LOGIN_NODE}.m2.smu.edu \
       -i ~/.ssh/mf2 \
       -N -4 \
       -o "StrictHostKeyChecking no" &
SSHPID=$!

echo "Jupyter notebook server now available at http://localhost:$NB_PORT?token=$NB_TOKEN"


trap ctrl_c INT
function ctrl_c() {
    echo "Closing notebook server"
    ssh mf2 "scancel $NB_JOB_ID"
    kill $SSHPID
    sleep 5
    exit
}

echo "Press CTRL-C at anytime to close the jupyter notebook server"
while true; do
    sleep 3
done
