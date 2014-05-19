#!/bin/bash
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
#Scripts overflow
#accessTransition.pl --> Transitions_extraction.pl --> run_transition.pl

outpath='' ## The folder where the output should be stored
inpath='' ## The folder which contains all input VCF files
samples=("SAMPLE-1" "SAMPLE-2") ## Input your sample names: VCF file should be named as SAMPLE-1_variations.vcf, SAMPLE-2_variations.vcf...
strand=("FR" "RR") 
for i in "${samples[@]}"
do
	for j in "${strand[@]}"
	do
		mkdir -p $outpath/$i/$j
	done
done






BaseQual=5 ## Your baseQuality cutoff
readDepth=2 ## Your ReadDepth cutoff
for i in "${samples[@]}"
do
VCF="$inpath/${i}_variations.vcf"

for j in "${strand[@]}"
do

perl Transitions_extraction.pl $BaseQual $i $readDepth $j $VCF $outpath
done
done

echo 'script v1.2'
echo 'Author: Santhilal Subhash'
echo 'Contact: santhilal.subhash@gu.se'
