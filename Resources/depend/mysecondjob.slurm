#!/bin/bash
#SBATCH --job-name="mysecondjob"
#SBATCH --time=0-000:02:00
#SBATCH --ntasks=1
#PBS -W x=depend:afterok:myfirstjob
# Note: SLURM defaults to running jobs in the directory
# where they are submitted, no need for $PBS_O_WORKDIR
echo $(hostname ) $SLURM_JOB_NAME running $SLURM_JOBID >> hostname.txt
sleep 60

