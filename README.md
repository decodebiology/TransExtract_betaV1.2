TransExtract Beta version 1.2
=============================

Extract Transitions from PARCLIP data. This is beta version, this could be improved by including more description about the results and also with graphical visualization.

Prerequisites: (For getting output as graphs)
--------------

Installed R version 2.0 or greater

Input VCF must be Version 4.0 (Output from tool Freebayes)

Execute/Run script: 
------------------

1) Unzip the TransExtract_betaV1.2.zip folder and go into the extracted folder.

2) Edit 'TransExtract.sh' file. The comments with two hashes '##' means the input must be provided.

3) Edit 'run_config.sh' file. The comments with two hashes '##' means the input must be provided.

4) chmod a+x *.pl

5) chmod a+x *.sh

6) ./TransExtract.sh


Scripts workflow:
----------------

accessTransition.pl --> Transitions_extraction.pl --> run_config.sh --> TransExtract.sh


INPUT: This supports VCF file from Freebayes (https://github.com/ekg/freebayes) or Other programs.


Conclusion from the run:
-----------------------

<img src="http://kandurilab.org/bioinformatics/github/TransExtract/transExtract_conversions.png"><br>
<b>Outcome in Publication:</b> Figure 1c from "<a href="https://www.nature.com/articles/ncomms8743"> <i>Mondal et. al, 2015</i>. MEG3 long noncoding RNA regulates the TGF-β pathway genes through formation of RNA–DNA triplex structures. <i>Nature Communications</i></a> (Scripts used for this publication)"



