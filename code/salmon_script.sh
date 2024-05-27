# Salmon_mapping.sh script does the following:
# for each SAMPLE in 'samples.txt':
#    process a corresponding fastq files with fastp
#    map the resulting file to the transcriptome using salmon quant

# edit necessary lines

while read SAMPLE; do
        echo "Running sample ${SAMPLE}"

        FASTQ1=${SAMPLE}_R1.fastq.gz                                      # fastq names
        #FASTQ2=${SAMPLE}_R2.fastq.gz

        FASTQ1_PATH="/path/to/file/${FASTQ1}"                             # <- edit the path to your fastqs
        #FASTQ2_PATH="/path/to/file/${FASTQ2}"

        #######################
        ##  PART1 Run fastp  ##
        #######################

        FASTQ1_FILT=${SAMPLE}_R1.filt.fastq.gz                            # fastp output
        FASTQ2_FILT=${SAMPLE}_R2.filt.fastq.gz

        FASTQ1_FILT_PATH="/path/to/file/${FASTQ1_FILT}"                   # <- edit the path to your filtered fastqs
        FASTQ2_FILT_PATH="/path/to/file/${FASTQ2_FILT}"

        #just because fastp has been already run (if not - unmute this command)
        #fastp -i ${FASTQ1_PATH} -I ${FASTQ2_PATH} -o ${FASTQ1_FILT_PATH} -O ${FASTQ2_FILT_PATH} -h ${SAMPLE}.fastp.html -j ${SAMPLE}.fastp.json

        #####################################
        ##  PART2 Map samples with Salmon  ##
        #####################################

        SALMON_TRANSCRIPTOME_INDEX_DIR="/path/to/index/"                  # <- add directory with transcriptome index
        SALMON_OUT_DIR="/path/to/salmon_output/${SAMPLE}"                 # <- add directory to store salmon output

        salmon quant -i ${SALMON_TRANSCRIPTOME_INDEX_DIR} \
                -l ISF \
                -1 ${FASTQ1_PATH} \
                -p 8 \
                -o ${SALMON_OUT_DIR} \
                --useVBOpt \
                --seqBias \
                --validateMappings

done < samples.txt
