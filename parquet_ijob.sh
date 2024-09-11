#!/bin/bash
#PBS -N text_to_parquet
#PBS -V -j oe -o ~/errors/pbs/"$PBS_JOBID.qlog"
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=40
#PBS -l nodes=1,instance_type=m6i.16xlarge,instance_ami=ami-014686993da8fbf1c
