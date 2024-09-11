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

for file in $(ls -Sr /shares/baxter/users/rdhakal/work_in_progress/allen_plots_waveforms/input | head -n 500)

do
	
	julia -t 16 /shares/baxter/users/rdhakal/work_in_progress/allen_plots_waveforms/blackbox/waveform_generator.jl -m /shares/baxter/users/rdhakal/work_in_progress/allen_plots_waveforms/input/$file -o /scratch/waveform -p -

	aws s3 sync /scratch/waveform/ s3://ddpsc-baxterlab-data/metabolomics/waveform_pipeline/sample_waveforms/

	rm -r /scratch/waveform

done
