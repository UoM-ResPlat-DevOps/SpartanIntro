#!/bin/bash
#SBATCH --job-name="file-array"
#SBATCH --ntasks=1
#SBATCH --time=0-00:15:00
#SBATCH --array=1-5
# Note: SLURM defaults to running jobs in the directory
# where they are submitted, no need for $PBS_O_WORKDIR
mkdir ${SLURM_ARRAY_TASK_ID}
