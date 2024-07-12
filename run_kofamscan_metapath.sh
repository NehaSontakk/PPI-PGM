#!/bin/bash
#SBATCH --job-name=kofamscan_metapath
#SBATCH --output=kofamscan_metapath%j.out
#SBATCH --mem-per-cpu=4GB
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=32:00:00
#SBATCH --account=twheeler
#SBATCH --partition=standard

# Common path variable
COMMON_PATH="/xdisk/twheeler/nsontakke/GapFilling/MPP_Jul24"

echo "Starting the job: $(date)"

# Load Conda
echo "Loading Conda environment..."
source /home/u13/nsontakke/miniconda3/etc/profile.d/conda.sh

# Activate kofamscan environment and run kofamscan
echo "Activating kofamscan-env and executing kofamscan..."
conda activate kofamscan-env
exec_annotation --cpu=8 \
-o $COMMON_PATH/kofamscan_output_bin.82.fa.txt \
/xdisk/twheeler/nsontakke/GapFilling/bin.82.fa.fna
echo "Kofamscan processing completed."


echo "Running file conversion..."
python $COMMON_PATH/Scripts/kofam_to_mpp_format_conversion.py $COMMON_PATH/kofamscan_output_bin.82.fa.txt
echo "File conversion completed."

# Switch to MetaPathPredict environment
echo "Switching to MetaPathPredict environment..."
conda activate MetaPathPredict

# Execute MetaPathPredict
echo "Running MetaPathPredict..."
MetaPathPredict --input $COMMON_PATH/kofamscan_output_bin.82.fa.tsv \
--annotation-format kofamscan --output $COMMON_PATH/MPP_output_bin.82.fa.tsv
echo "MetaPathPredict analysis completed."

echo "Job completed: $(date)"

