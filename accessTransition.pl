#!/usr/bin/perl
$/=undef;
#Author: Santhilal Subhash
#Contact: santhilal.subhash@gu.se
#script v1.2
open(IN,$ARGV[0]);
($inRef,$inAlt)=split(":",$ARGV[1]);
$FilterQual=$ARGV[2];
$inDP=$ARGV[3];
$strand=$ARGV[4];
$file=<IN>;
@line=split("\n",$file);


foreach $line(@line)
{
	if(!($line=~/#/))
	{
		($chr,$pos,$id,$ref,$alt,$qual,$filt,$info,$format,$sample)=split("\t",$line);
		
			if($inRef ne $inAlt)
    			{
				if($ref eq $inRef && $alt eq $inAlt && $qual<=$FilterQual)
				{
					
					($ns,$nsVal,$dp,$dpVal)=split(/[;=]/,$info);
					($gt,$gq,$gl,$dp,$ra,$aa,$sr,$sa)=split(/[:]/,$sample);
					($ref_dpF,$ref_dpR)=split(/[\|]/,$sr);
					($alt_dpF,$alt_dpR)=split(/[\|]/,$sa);
					$TotalDp=$ref_dpF+$ref_dpR+$alt_dpF+$alt_dpR;
					$refVSalt=(($alt_dpF+$alt_dpR)/($TotalDp))*100;
					if($strand eq "FR")
					{
						if($alt_dpF>0 && $TotalDp>=$inDP)
						{
							print "$chr\t$pos\t$ref\t$alt\t$ref_dpF\t$ref_dpR\t$alt_dpF\t$alt_dpR\t$TotalDp\t$refVSalt\n";
				
						}
					}
					if($strand eq "RR")
					{
						if($alt_dpR>0 && $TotalDp>=$inDP)
						{
							print "$chr\t$pos\t$ref\t$alt\t$ref_dpF\t$ref_dpR\t$alt_dpF\t$alt_dpR\t$TotalDp\t$refVSalt\n";
				
						}
					}
					
		
				}
		
			}
	}



}
