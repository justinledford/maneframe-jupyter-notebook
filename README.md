Setup:
- Fill in `USERNAME` in `setup.sh` and `launch_nb.sh`  
- Run `setup.sh`  
  - This will generate a SSH key pair, copy to ManeFrame2, along with a script to launch the notebook server  

Usage:
- Run `launch_nb.sh`  
  - If successful, your default browser should open a tab with the Jupyter Notebook home.
- Edit `TIME_LIMIT` in `start_job.sh` if you need the compute node to run for more than 2 hours
- Edit `NODETYPE` in `start_job.sh` to use a different node type

Todo:
- Check that selected port isn't already in use  
- Put `start_job.sh` inline into `launch_nb.sh`  

Should be compatible with Linux and OS X
