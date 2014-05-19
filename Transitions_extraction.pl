#!/usr/bin/perl -w
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
# base call accuracy: <=40 (90-99.99%)
print "Started....\n";
$date=`echo \`date\``;print "$date\n";
$/=undef;
$outpath=$ARGV[5];
$inFile=$ARGV[4];
@trans=ordered_combinations([qw(A T G C)], 2);
foreach $trans (@trans)
{   
	($inRef,$inAlt)=split(//,$trans);
	if($inRef ne $inAlt)
   	{
     		$cmd1="perl accessTransition.pl $inFile $inRef:$inAlt $ARGV[0] $ARGV[2] $ARGV[3] > $outpath/$ARGV[1]/$ARGV[3]/$inRef\_$inAlt.txt";
print "Processed: $ARGV[1]\t$ARGV[3]\t$inRef\_$inAlt\n";

		system($cmd1);
    	}
}
$cmd2="wc -l $outpath/$ARGV[1]/$ARGV[3]/* > $outpath/$ARGV[1]/$ARGV[3]/summary.txt";
system($cmd2);
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
