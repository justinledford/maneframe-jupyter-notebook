Setup:
- Generate a SSH keypair and place in both local .ssh and maneframe .ssh
- Place `jupyter.job` in `~/scratch/`
- Edit `USERNAME` in `launch_nb.sh` and `-D` in `jupyter.job`

Usage:
- Run `launch_nb.sh`

Todo:
- Check that selected port isn't already in use
- Setup script
- Put `start_job.sh` inline into `launch_nb.sh`
