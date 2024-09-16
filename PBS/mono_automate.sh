#!/bin/bash
#PBS -N progenesis_mono
#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=1024
#PBS -l nodes=1,instance_type=r6a.8xlarge
threads=32

source ~/.bash_profile

conda activate mono

input=$input_path

cd /scratch

mkdir input_files

aws s3 sync $input_path input_files

# This is where I have the thermo executables, they might be in a different place for you

aws s3 sync s3://ddpsc-baxterlab-data/Rijan/executables/thermo/ .

parallel -j $threads '

        base_name="$(basename -- {})" \

         base_name="${base_name%.*}" \

        output_file_name="${base_name}.rawoutput.txt" \

        mono fileProcessor.exe {} . \

        aws s3 cp "$output_file_name" $output_path \

        rm "$output_file_name" \

' ::: input_files/*.raw
