#!/bin/bash
#PBS -N general_compression_pipeline
#PBS -e /shares/baxter/users/rdhakal/errors/pbs/error/
#PBS -o /shares/baxter/users/rdhakal/errors/pbs/output/
#PBS -q normal
#PBS -P baxter
#PBS -l system_metrics=true
#PBS -l scratch_size=10
#PBS -l nodes=1,instance_type=h1.4xlarge,spot_price=auto,instance_ami=ami-014686993da8fbf1c

source ~/.bash_profile

compress_directory() {
    # Default compression level
    local COMP_LEVEL=6

    # Parse options
    while getopts ":l:" opt; do
        case ${opt} in
            l)
                COMP_LEVEL=$OPTARG
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                return 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                return 1
                ;;
        esac
    done
    shift $((OPTIND -1))

    # Check if an argument is provided
    if [ $# -ne 1 ]; then
        echo "Usage: compress_directory [-l level] <directory>"
        return 1
    fi

    # Get the directory name from the argument
    local SOURCE_DIR="$1"

    # Extract the basename of the directory
    local BASENAME=$(basename "$SOURCE_DIR")

    # Create a tar archive of the directory
    tar -cvf - "$SOURCE_DIR" | zstd --ultra -$COMP_LEVEL -o "$BASENAME.tar.zst"

    echo "Compressed archive saved as $BASENAME.tar.zst"
}
