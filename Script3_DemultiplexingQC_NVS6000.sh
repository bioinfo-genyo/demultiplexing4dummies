#!/usr/bin/env bash

### Set the variables for the execution: ###

# 1. Set full path to the run folder.
RUN_DIR=~/Data/250110_M06854_0104_000000000-LR55V/
# 2. Set samplesheet file name.
SAMPLE_SHEET=SampleSheet.csv
# 3. Set the processor threads to use. $(nproc --all) to use all available threads.
THREADS=$(nproc --all)

### RUN DEMULTIPLEXING ### 
# The new fastqs will be stored in a folder named fastq inside de run folder.

bcl2fastq \
--runfolder-dir ${RUN_DIR} \
--output-dir ${RUN_DIR}/fastq/ \
--sample-sheet ${RUN_DIR}/${SAMPLE_SHEET} \
--barcode-mismatches 0 \
--no-lane-splitting
#--ignore-missing-bcls

### RUN QC ###

# Create folder to store reports.
mkdir -p ${RUN_DIR}/fastq/QC/multiqc
# Run fastqc using the defined number of threads.
fastqc -q -t $THREADS -o ${RUN_DIR}/fastq/QC ${RUN_DIR}/fastq/*.fastq.gz
# Run multiqc and store the report in RUN_DIR/fastq/QC/multiqc
multiqc -q -f -o ${RUN_DIR}/fastq/QC/multiqc ${RUN_DIR}/fastq/QC
