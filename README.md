Setup:
- Generate a SSH keypair named `mf2`
  - Place both keys in your local `.ssh` and in your ManeFrame2 `.ssh`   
    - (Both keys are needed on ManeFrame2 for the tunnel from compute nodes back to login nodes)
  - Add `mf2.pub` to `~/.ssh/authorized_keys`
- Place `jupyter-notebook.sh` in `~/scratch/` on ManeFrame2
- Edit `USERNAME` in `launch_nb.sh`

Usage:
- Run `launch_nb.sh`, if successful, a URL will be given that can be opened on your local machine.

Todo:
- Check that selected port isn't already in use
- Setup script
- Put `start_job.sh` inline into `launch_nb.sh`
- Auto open in browser
