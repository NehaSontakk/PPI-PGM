
### Step-by-Step Guide

1. Using FOAM with BATH
      - Bathconvert FOAM HMMs to BHMMs
      -       /xdisk/twheeler/nsontakke/GapFilling/FOAM_BATH_Jul24/Scripts/bathconvert_foam.sh 
2. Running MetaPathPredict with kofamscan
      - config.yml specifications for ko_list and profiles db
      -       sbatch /xdisk/twheeler/nsontakke/GapFilling/MPP_Jul24/Scripts/run_kofamscan_metapath.sh
      -   (Convert .fna file to MPP format, also uses kofam_to_mpp_format_conversion.py script, run MPP on file to generate .tsv)
      -   kofamscan/ kofamkoala uses HMMs made from KEGG modules to find modules in amino acid sequences.
      -   Where do I get amino acids from?
      - - BATH using TIGRFAM or something on bin82 data
        - Prokka .faa file which I already have available?
4. Preliminary Output Analysis
5. Comparing pathways 

### Installations

1. MPP
2. kofamscan
3. Bathsearch

### Databases

1. FOAM

ECOLI EXPTS SEPERATE:
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
   /home/u13/nsontakke/miniconda3/envs/kofamscan_env/bin/exec_annotation --cpu=8 -k /xdisk/twheeler/nsontakke/GapFilling/kofamscan_input/ko_list -o /xdisk/twheeler/nsontakke/GapFilling/Ecoli_Data/KO_GCF_000005845.2_ASM584v2.txt /xdisk/twheeler/nsontakke/GapFilling/Ecoli_Data/GCF_000005845.2_ASM584v2_cds_from_genomic.fna

4. **Run kofamscan output through MetaPathPredict**

   Clone the MetaPathPredict repository and set it up.
   ```bash
   conda activate MetaPathPredict
   MetaPathPredict --input /xdisk/twheeler/nsontakke/GapFilling/kofamscan_output/Ecoli_kofamscan_output.tsv --annotation-format kofamscan --output Ecoli_Metapath.tsv
