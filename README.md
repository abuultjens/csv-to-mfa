# csv-to-mfa
Converts csv with binary allele data (long) to multifasta alignment. If using AGCT data, use AGCT-csv_to_mfa.

# Author
Andrew Buultjens

# Synopsis
Converts a binary csv file with header and index columns (wide) into a multi fasta alignment. The csv must be in wide format: columns are observations and rows are features. The csv file will have '0' and '1' coded as 'A' and 'T', respectively.

# Usage
```
% sh csv-to-mfa.sh INFILE.csv OUTFILE.aln
```
