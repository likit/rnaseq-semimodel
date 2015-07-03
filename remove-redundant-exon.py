#!/usr/bin/env python
'''Description'''
import sys
import csv

def main():
    '''Main function'''
    exon_list = []
    for row in sys.stdin:
        cols = row.split('\t')
        start = int(cols[3]) - 1 # BED is zero-based
        end = int(cols[4])
        exon_list.append('\t'.join([cols[0], str(start), str(end)]))

    for exon in set(exon_list):
        print exon


if __name__=='__main__':
    main()

