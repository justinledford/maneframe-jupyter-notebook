#!/bin/bash
#
# This script is executed on a compute node from srun

# load modules
module load python/3
module load tensorflow/1.2_gpu

# start jupyter notebook server

#TODO: check if port is in use
PORT=$(echo "49152+$(echo ${SLURM_JOBID} | tail -c 4)" | bc)

# Needed if jupyter notebook is trying to write to a system level
# directory
unset XDG_RUNTIME_DIR

jupyter notebook --no-browser --ip=127.0.0.1 --port=$PORT > /dev/null 2>&1 &

# sleep a few seconds to wait for notebook server to start
# then grab the token
sleep 5
TOKEN=$(jupyter notebook list | grep -oP '[a-f0-9]{48}')

echo "NB_PORT=$PORT NB_TOKEN=$TOKEN NB_LOGIN_NODE=$LOGIN_NODE NB_JOB_ID=$SLURM_JOBID"

# forward port back to login node
ssh -N -R ${PORT}:localhost:${PORT} $LOGIN_NODE.m2.smu.edu -i ~/.ssh/mf2
