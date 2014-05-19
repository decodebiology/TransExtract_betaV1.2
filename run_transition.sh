#!/bin/bash
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
#Scripts overflow
#accessTransition.pl --> Transitions_extraction.pl --> run_transition.pl
outpath=$1
inpath=$2
#samples=$3
BaseQual=$4
readDepth=$5

IFS=',' read -ra samples <<< "$3"

strand=("FR" "RR") 
for i in "${samples[@]}"
do
	for j in "${strand[@]}"
	do
		mkdir -p $outpath/$i/$j
	done
done


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
