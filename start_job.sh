export LOGIN_NODE=`cat /etc/hostname`
srun -p gpgpu-1 scratch/jupyter.job --export=LOGIN_NODE
