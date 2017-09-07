export LOGIN_NODE=`cat /etc/hostname`
srun -p gpgpu-1 scratch/jupyter-notebook.sh --export=LOGIN_NODE
