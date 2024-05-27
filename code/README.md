## Installation
1. Clone the repository to your local computer
```
git clone git@github.com:Alisa411/UBE2A_project.git
cd UBE2A_project
```
2. Create and activate a conda environment
```
conda env create --file salmon_environment.yaml
conda activate salmon
```

## STEP 1. Mapping to transcriptome
1. Make sure you have downloaded reference transcriptome (can be downloaded here https://www.ensembl.org/Homo_sapiens/Info/Index) and prepared index of it. If you do not have pre-computed index, use this command:
```
salmon index -t /path/to/transcriptome -i transcriptome/
```
2. Create a file samplex.txt with accesion numbers without prefix
122G4505_S7_R1.fastq.gz --> 122G4505

Example:
```
1224707_S10
1224808_S11
1224909_S12
```
3. Run the script.
I suggest to use screen for this purpose. Do not forget to activate environment there!
```
screen -S salmon
bash salmon_script.sh
```
4. As the output you will obtain folder with quanf.sf files. These files are used in the following differential expression analysis.

## STEP 2. Differential expression analysis
There are the corresponding files:
1. DESeq2_pairwise_script.Rmd file provides the differential expression analysis for paired samples you would like to compare (experiment vs control). It also provides the correlation plots in case you have proteomic data;
2. DESeq2_multisampling.Rmd file performs the LRT test to determine all genes that have significant differences in expression across samples with gene dosage alterations (control - knockout - overexpression).

All the requirements and instructions are provided in the files.
