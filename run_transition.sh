#!/bin/bash
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
#Scripts overflow
#accessTransition.pl --> Transitions_extraction.pl --> run_transition.pl
./config.sh
export outpath
export inpath
export samples
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
