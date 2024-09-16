#!/bin/bash
#PBS -N text_to_parquet
#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=40
#PBS -l nodes=1,instance_type=r6a.8xlarge,spot_price=auto

mount-s3 --read-only ddpsc-baxterlab-data ~/s3_drive/

source ~/.bash_profile

conda activate polars

python /shares/baxter/users/rdhakal/repos/metablify/preprocessing_toolchain/Metablify_preprocessor_toolchains/compress_tabular_data.py --config /shares/baxter/users/rdhakal/work_in_progress/broad.yaml
