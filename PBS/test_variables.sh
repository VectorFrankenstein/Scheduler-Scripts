#!/bin/bash
#PBS -N progenesis_mono
#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=80
#PBS -l nodes=1,instance_type=t3a.nano,instance_ami=ami-014686993da8fbf1c

echo $first_one

echo $second_one
