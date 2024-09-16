#!/bin/bash
#PBS -N lewis_data_compression
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/$PBS_JOBNAME.o$PBS_JOBID
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=10
#PBS -l nodes=1,instance_type=h1.4xlarge,instance_ami=ami-014686993da8fbf1c
source ~/.bash_profile

cd /shares/baxter/users/rdhakal/data/ihub_data_compression/

bash /shares/baxter/users/rdhakal/data/ihub_data_compression/compress_all.sh
