#!/usr/bin/perl -w
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
# base call accuracy: <=40 (90-99.99%)
print "Started....\n";
$date=`echo \`date\``;print "$date\n";
$/=undef;
$BaseQ=$ARGV[0];
$sample=$ARGV[1];
$ReadDP=$ARGV[2];
$strand=$ARGV[3];
$inFile=$ARGV[4];
$outpath=$ARGV[5];
$AltReadDepth=$ARGV[6];


@trans=ordered_combinations([qw(A T G C)], 2);
foreach $trans (@trans)
{   
	($inRef,$inAlt)=split(//,$trans);
	if($inRef ne $inAlt)
   	{
     		$cmd1="perl ./accessTransition.pl $inFile $inRef:$inAlt $BaseQ $ReadDP $strand $AltReadDepth > $outpath/$sample/$strand/$inRef\_$inAlt.txt";

print "Processed: $sample\t$strand\t$inRef\_$inAlt\n";

		system($cmd1);
    	}
}
#$cmd2="wc -l $outpath/$sample/$strand/* > $outpath/$sample/$strand/summary.txt";
#system($cmd2);
open(FILE, ">>$outpath/$sample/$strand/summary.txt");
print FILE "Trans\tnumber\n";
open(RFILE, ">>$outpath/plot.R");
foreach $trans (@trans)
{ 
	($inRef,$inAlt)=split(//,$trans);
	if($inRef ne $inAlt)
   	{

		open(OUT,"$outpath/$sample/$strand/$inRef\_$inAlt.txt");
		$res=<OUT>;
		@num=split("\n",$res);
		print FILE "$inRef\_$inAlt\t$#num\n";
		

	}
	

}
close(FILE);
print RFILE "#/usr/bin/R\n$sample\_$strand <- read.table(\"$outpath/$sample/$strand/summary.txt\", header=TRUE, sep=\"\\t\")\npdf(\"$outpath/plots/$sample\_${strand}_summary.pdf\")\nplot($sample\_$strand\[,2\], xaxt = \"n\", type=\"l\")\naxis(side=1, at=1:12, labels=$sample\_$strand\[,1\] ,cex.axis=0.5,par(las=1))\ndev.off()\n";
close(RFILE);

open(PARAM, ">>$outpath/parameters_used.txt");

print PARAM "\n-------------------------\nParameters used for the analysis\n-------------------------\nBase Quality >= $BaseQ\nRead depth >= $ReadDP\nAlternate Read depth >= $AltReadDepth\nInput files used: $inFile\nOutput of analysis: $outpath\n\n";

close(PARAM);


print "\nFinished processing.....\n";
$date=`echo \`date\``;print "$date\n";
#subroutine
sub ordered_combinations
{
    my ($data, $k) = @_;
    
    return @$data if $k == 1;
    
    my @previous = ordered_combinations($data, $k-1);
    
    my @results;
    for my $letter (@$data) {
        push @results, map { $letter . $_ } @previous;
    }
    
    return @results;
} 
