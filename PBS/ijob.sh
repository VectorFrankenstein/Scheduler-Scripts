#!/bin/bash

#PBS -N rijan_interactive_session

#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/

#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=500
#PBS -l nodes=1,instance_type=r5ad.2xlarge

mount-s3 --read-only ddpsc-baxterlab-data ~/s3_drive/

source ~/.bash_profile
