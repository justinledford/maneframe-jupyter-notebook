NODETYPE=development
TIME_LIMIT=120

export LOGIN_NODE=`cat /etc/hostname`
srun -p $NODETYPE scratch/jupyter_notebook.sh -t $TIME_LIMIT --export=LOGIN_NODE
