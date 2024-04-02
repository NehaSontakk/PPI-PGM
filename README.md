
### Step-by-Step Guide

Follow these steps to run your analysis:

1. **Download *E. coli* data from NCBI**

   Visit [NCBI](https://www.ncbi.nlm.nih.gov/) and search for [*E. coli*](https://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Escherichia_coli/reference/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_cds_from_genomic.fna.gz) data sets.

2. **Run it through kofamscan**

   Clone the [kofamscan](https://github.com/takaram/kofam_scan) repository
   Download ko list and hmm profiles from ftp://ftp.genome.jp/pub/db/kofam/
   Specify these paths in config.yml
   config.yml is stored in the same spot exec_annotation is stored in (the bin)
    

   ```bash
   conda activate kofamscan-env
   /home/u13/nsontakke/miniconda3/envs/kofamscan_env/bin/exec_annotation -k /xdisk/twheeler/nsontakke/GapFilling/kofamscan_input/ko_list -o /xdisk/twheeler/nsontakke/GapFilling/Ecoli_Data/KO_GCF_000005845.2_ASM584v2.txt /xdisk/twheeler/nsontakke/GapFilling/Ecoli_Data/GCF_000005845.2_ASM584v2_cds_from_genomic.fna

4. **Run kofamscan output through MetaPathPredict**

   Clone the MetaPathPredict repository and set it up.
   ```bash
   conda activate MetaPathPredict
   MetaPathPredict [-h] --input INPUT [INPUT ...] --annotation-format ANNOTATION_FORMAT
                       [--kegg-modules KEGG_MODULES [KEGG_MODULES ...]] --output OUTPUT
