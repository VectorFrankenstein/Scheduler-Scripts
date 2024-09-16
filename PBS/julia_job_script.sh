#!/bin/bash
#PBS -N waveform_generation_for_allen
#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=10
#PBS -l nodes=1,instance_type=h1.4xlarge,instance_ami=ami-014686993da8fbf1c

source ~/.bash_profile

julia /shares/baxter/users/rdhakal/work_in_progress/allen_plots_waveforms/blackbox/waveform_generator.jl -m /shares/baxter/users/rdhakal/work_in_progress/allen_plots_waveforms/input/100.00294372759859.tsv -o /scratch/waveform -p -

aws s3 sync /scratch/waveform/ s3://ddpsc-baxterlab-data/metabolomics/waveform_pipeline/sample_waveforms/

du -h /scratch/waveform

rm -r /scratch/waveform
