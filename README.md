
### Step-by-Step Guide

Follow these steps to run your analysis:

1. **Download *E. coli* data from NCBI**

   Visit [NCBI](https://www.ncbi.nlm.nih.gov/) and search for *E. coli* data sets. Download your dataset of interest.

2. **Run it through kofamscan**

   Clone the [kofamscan](https://github.com/takaram/kofam_scan) repository 

   ```bash
   conda activate kofamscan-env
   /home/u13/nsontakke/miniconda3/envs/kofamscan_env/bin/exec_annotation -f /xdisk/twheeler/nsontakke/GapFilling/Ecoli_Data/GCF_000005845.2_ASM584v2_cds_from_genomic.fna

3. **Run kofamscan output through MetaPathPredict**

   Clone the MetaPathPredict repository and set it up.
   ```bash
   conda activate MetaPathPredict
   MetaPathPredict [-h] --input INPUT [INPUT ...] --annotation-format ANNOTATION_FORMAT
                       [--kegg-modules KEGG_MODULES [KEGG_MODULES ...]] --output OUTPUT
