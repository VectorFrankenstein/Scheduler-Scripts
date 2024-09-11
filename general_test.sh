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

#PBS -l nodes=1,instance_type=r5a.8xlarge

# what should be the size of the scratch directory

#PBS -l scratch_size=200

# specify the tasks that will be executed

source ~/.bash_profile

# repl is the name of the env that I use, you should make one yourself
conda activate spores

cd /scratch/

aws s3 sync s3://ddpsc-baxterlab-data/rijan_backups/works_in_progress/busted_ph_test/ .

#hyphy BUSTED-PH.bf --alignment test-contrast-nuisance.fas --tree test-contrast-nuisance.nwk --srv No --branches TEST --comparison REFERENCE

hyphy BUSTED-PH.bf --alignment OG0000157.no_duplicates.fa --tree OG0000157.ref_coded.nwk --srv No --branches test --comparison reference

aws s3 sync . s3://ddpsc-baxterlab-data/rijan_backups/works_in_progress/busted_ph_test/test_output/
