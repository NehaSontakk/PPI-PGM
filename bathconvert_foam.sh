#!/bin/bash
#SBATCH --job-name=bathconvert_parallel
#SBATCH --output=bathconvert_parallel_%j.out
#SBATCH --mem-per-cpu=4GB
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=32:00:00
#SBATCH --account=twheeler
#SBATCH --partition=standard

echo "Process started at $(date)"

# Define the input and output directories
INPUT_DIR="/xdisk/twheeler/twheeler/notebook/2024/07-10-foamv2/FOAM_version2/"
OUTPUT_DIR="/xdisk/twheeler/nsontakke/GapFilling/FOAM_BATH_Jul24/FOAM_BATH_HMMs_Jul24"
bathconv_exec="/home/u13/nsontakke/BATH/src/bathconvert"

# Create the output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Navigate to the input directory
cd "$INPUT_DIR"

# Loop through all .hmm files in the input directory
for file in *.hmm; do
    # Get the base filename without extension
    base_filename=$(basename "$file" .hmm)

    # Define the output file path
    output_file="${OUTPUT_DIR}/${base_filename}.bhmm"

    # Check if the corresponding output file already exists
    if [ ! -f "$output_file" ]; then
        # Run bathconvert on the file
        ${bathconv_exec} "$output_file" "$file"
    else
        echo "Output file ${output_file} already exists. Skipping conversion for ${file}."
    fi
done

echo "Conversion completed. Files have been saved to $OUTPUT_DIR"

# Concatenate all .bhmm files into one
cat "${OUTPUT_DIR}"/*.bhmm > "${OUTPUT_DIR}/../ALL_FOAM_BHMMs.bhmm"

echo "Process completed at $(date)"
