TransExtract Beta version 1.2
=============================

Extract Transitions from PARCLIP data. This is beta version, this could be improved by including more description about the results and also with graphical visualization.

Run script: 

1) Unzip the TransExtract_betaV1.2.zip folder and go into the extracted folder
2) Edit 'TransExtract.sh' file. The comments with two hashes '##' means the input must be provided.
3) chmod a+x *.pl
4) chmod a+x *.sh
5) ./TransExtract.sh


Scripts workflow:

accessTransition.pl --> Transitions_extraction.pl --> run_config.sh --> TransExtract.sh


INPUT: This supports VCF file from Freebayes (https://github.com/ekg/freebayes) or Other programs.
