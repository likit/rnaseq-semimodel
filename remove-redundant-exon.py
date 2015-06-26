#!/usr/bin/env python
'''Description'''
import sys
import csv

def main():
    '''Main function'''
    exon_list = []
    for row in sys.stdin:
        cols = row.split('\t')
        exon_list.append(cols[0] + ':' + cols[3] + '-' + cols[4])

    for exon in set(exon_list):
        print exon


if __name__=='__main__':
    main()

