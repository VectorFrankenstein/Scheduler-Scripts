#!/bin/bash

# Specify the jobs names and metadata here

#PBS -N broad_iaa_data

# the directory before the last / needs to exist for it to work

#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/

#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true

# specify the instance type and size here.

#PBS -l nodes=1,instance_type=t3a.xlarge

# what should be the size of the scratch directory

#PBS -l scratch_size=2000

# specify the tasks that will be executed

source ~/.bash_profile

# Export the aws keys


# mount the directory of choice

#mount-s3 --read-only ddpsc-baxterlab-data storage-root/


# repl is the name of the env that I use, you should make one yourself
conda activate polars
jupyter lab --no-browser --port=8080
