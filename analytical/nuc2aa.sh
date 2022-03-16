#!/bin/bash
## nucleotide to aminoacid
## 1. translate the input fasta to protein sequence with EMBOSS 
input=$1
annotation=$2
protein_output="${annotation}.pep"

/Users/jianichen1/EMBOSS-6.6.0/emboss/transeq $input  $protein_output -sformat pearson

sed  -i.bak 's/_1$//' $protein_output
echo "nucleotides have been translated into proteins in the file $protein_output"