# photoacid-env

Containerized environment for Photoacid Searching

To install on Grace, run

```commandline
module load WebProxy
username="$(whoami)"
export SINGULARITY_CACHEDIR="/scratch/user/$username/.singularity/cache"
singularity pull docker://ghcr.io/tabor-research-group/photoacid-env:latest
```
