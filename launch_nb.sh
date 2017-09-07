#!/bin/bash

USERNAME=

echo "Launching jupyter notebook..."

# Remove previous env file
rm -f .mfnb.env

# Start jupyter notebook on compute node
# and get the following variables
#
# NB_PORT - The port that jupyter notebook is running on
# NB_LOGIN_NODE - The login node that the compute node is tunnelling to
# NB_TOKEN - Jupyter notebook token
# NB_JOB_ID - Slurm job ID
ssh ${USERNAME}@m2.smu.edu -i ~/.ssh/mf2 'bash -s' > .mfnb.env < start_nb_server.sh &

# Wait until env file is filled with variables
while true; do
    if [ -s .mfnb.env ]; then
        break
    fi
    sleep 1
done

# Load environment variables
source .mfnb.env

# Forward requests on NB_PORT to login node
ssh -L $NB_PORT:localhost:$NB_PORT \
       ${USERNAME}@${NB_LOGIN_NODE}.m2.smu.edu \
       -i ~/.ssh/mf2 \
       -N -4 \
       -o "StrictHostKeyChecking no" &
SSHPID=$!

URL="http://localhost:$NB_PORT?token=$NB_TOKEN"
echo "Jupyter notebook server now available at $URL"

# Open in default browser
case $(uname -s) in
    Linux*) xdg-open "$URL" &>/dev/null;;
    Darwin*) open "$URL" &>/dev/null;;
esac

# Interrupt handler
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
