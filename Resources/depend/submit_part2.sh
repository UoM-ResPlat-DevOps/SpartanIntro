#!/bin/bash

FIRST=$(sbatch myjob4.slurm)
echo $FIRST
SUB1=$(echo ${FIRST##* })
SECOND=$(sbatch --dependency=afterany:$SUB1 myjob5.slurm)
echo $SECOND
SUB2=$(echo ${SECOND##* })
THIRD=$(sbatch --dependency=afterany:$SUB2 myjob6.slurm)
echo $THIRD
