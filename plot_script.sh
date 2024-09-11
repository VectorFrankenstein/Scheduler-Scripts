#!/bin/bash
#PBS -N plot_script_for_allen
#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=10
#PBS -l nodes=1,instance_type=h1.4xlarge,instance_ami=ami-014686993da8fbf1c

source ~/.bash_profile

mount-s3 ddpsc-baxterlab-data /shares/baxter/users/rdhakal/s3_drive

for file in $(find /shares/baxter/users/rdhakal/s3_drive/metabolomics/waveform_pipeline/sample_waveforms -mindepth 1 -name "1.tsv")

do
	
	julia --threads auto /shares/baxter/users/rdhakal/work_in_progress/allen_plots_waveforms/blackbox/waveform_viz.jl -m $file -o /scratch/

	aws s3 mv /scratch/*.svg s3://ddpsc-baxterlab-data/metabolomics/plotting_wavefroms/

	#rm /scratch *.svg

done
