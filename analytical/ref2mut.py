#!/usr/bin/env python
# coding: utf-8

# In[ ]:


## get mutation from a MSA with ref sequence fasta
## to run this script: python ref2mut.py input.fasta ref.fasta out.log
## output is a csv file

from Bio import SeqIO
import numpy as np
import os,sys
import pandas as pd
import argparse


# In[ ]:




def map_mutation(input_fasta,ref_fasta, output):
    seq_records = SeqIO.parse(input_fasta, 'fasta')
    ref_records = SeqIO.parse(ref_fasta, 'fasta')
    df = pd.DataFrame(columns=['seq_id','location','mutate','ref'])
    n=0

    refseq_record =next(ref_records)
    for seq_record in seq_records:
        for i in range(0, len(refseq_record)):
            nt1 = refseq_record[i]
            nt2 = seq_record[i]
            if nt1 != nt2:
                n=n+1
                df.loc[n, ['seq_id']] = seq_record.id
                df.loc[n, ['location']] = i+1
                df.loc[n, ['mutate']] = nt2
                df.loc[n, ['ref']] = nt1
                #print(seq_record.id, i+1, nt2, nt1)
                
   
    df.to_csv(output, index=False)
    return(df)     


# In[ ]:


def main():
    
    print("calling mutation from referencere")
    input_fasta = sys.argv[1]
    ref_fasta=sys.argv[2]
    output=sys.argv[3]    
    map_mutation(input_fasta,ref_fasta,output)
    
main()    

