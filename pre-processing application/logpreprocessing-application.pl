#!/usr/bin/perl

use strict;
#use warnings;

open(IN2, "<", $ARGV[0]);
open(IN, "<", $ARGV[1]);
#adiciona a informa��o por baixo
open(OUT, ">>", $ARGV[2]);
open(OUT2, ">>", "logs_metalogs.txt");

my @tmp;

my $datetimelog = `date +'%d-%m-%Y %H:%M:%S'`;
my $userlog= `whoami`;
my $hostnamelog = `hostname`;

if(@ARGV != 3) {
	print "Incomplete number of files.\n";
	print OUT2 "Datetime:$datetimelog Source:$hostnamelog User:$userlog Message:Incomplete number of files.\n";
}
 elsif ((! -e $ARGV[0]) or (! -e $ARGV[1])) {
	print "File doesn't exists.\n";
	print OUT2 "Datetime:$datetimelog Source:$hostnamelog User:$userlog Message:File doesn't exists.\n";
} 
else {
	foreach $_ (<IN2>){
		next if /#Datetime, Source, Level, Source Computer, User, Serverity, Event ID, Description, Process ID, Thread ID, Delimitador/;
		chomp $_;
		$_ =~ tr/=/,/s;
		@tmp = split(/,/,$_);
	}

	my $line = 0;
	foreach $_ (<IN>){
		chomp $_;
		$line++;
		$_ =~ eval "tr/$tmp[10]/&/s";
		#die "tr/$tmp[10]/&/s;";
		my ($datetime, $source, $levelLogName, $sourceComputer, $user, $severityName, $eventID, $description, $processID, $threadID) = (split /&/, $_)[$tmp[0],$tmp[1],$tmp[3],$tmp[4],$tmp[5],$tmp[6],$tmp[7],$tmp[8],$tmp[9]];
		print OUT "$ARGV[1]&$line&$datetime&$source&$levelLogName&$sourceComputer&$user&$severityName&$eventID&$description&$processID&$threadID\n";
	}
}
close(IN);
close(IN2);
close(OUT);
close(OUT2);

exit(0);
