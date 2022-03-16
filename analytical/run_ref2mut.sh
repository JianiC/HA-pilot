#!/bin/bash

## find input seq
## example: sh run_ref2mut.sh >BE92|CY112733 Smith_vaccine.pep FU02 Smith_HA_mrca.pep  FU02_out.log

awk '{ if ((NR>1)&&($0~/^>/)) { printf("\n%s", $0); } else if (NR==1) { printf("%s", $0); } else { printf("\t%s", $0); } }' $1 |grep $2  |tr "\t" "\n" >input.fasta
awk '{ if ((NR>1)&&($0~/^>/)) { printf("\n%s", $0); } else if (NR==1) { printf("%s", $0); } else { printf("\t%s", $0); } }' $3 |grep $4  |tr "\t" "\n" >ref.fasta

python ref2mut.py input.fasta ref.fasta $5
rm input.fasta
rm ref.fasta