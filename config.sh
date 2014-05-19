#!/bin/bash
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
#Scripts overflow
#accessTransition.pl --> Transitions_extraction.pl --> run_transition.pl

outpath='' ## The folder where the output should be stored
inpath='' ## The folder which contains all input VCF files
samples=("SAMPLE-1" "SAMPLE-2") ## Input your sample names: VCF file should be named as SAMPLE-1_variations.vcf, SAMPLE-2_variations.vcf...
