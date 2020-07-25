#!/usr/bin/perl

use strict;
#use warnings;

my $directory = $ARGV[0];
opendir(DIR, $directory);

my $filename;

my @array;

my $datetimelog = `date +'%d-%m-%Y %H:%M:%S'`;
my $userlog= `whoami`;
my $hostnamelog = `hostname`;

open(OUT, ">>", $ARGV[1]); 
open(OUT2, ">>", "logs_template.txt");

if(@ARGV != 2) {
	print "Incomplete number of arguments.\n";
	print OUT2 "Datetime:$datetimelog Source:$hostnamelog User:$userlog Message:Incomplete number of files.\n";
}
 elsif ((! -e $ARGV[0])) {
	print "Directory doesn't exists.\n";
	print OUT2 "Datetime:$datetimelog Source:$hostnamelog User:$userlog Message:Directory doesn't exists.\n";
	
}
else {
	print OUT "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	print OUT "<events>\n";

	while ($filename = readdir(DIR)) {
		next if $filename =~ /^\./;
		next if $filename =~ /^*\.pl/;
		next if $filename =~ /^*\.xml/;

		open (IN, "<", "$filename");
	
		@array = <IN>;

		foreach my $i (@array) {
			chomp $i;

			my ($file, $line, $datetime, $source, $levelLogName, $sourceComputer, $user, $severityName, $eventID, $description, $processID, $threadID) = (split /&/, $i)[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    
   			print OUT "<event>\n";
    			print OUT "<timestamp>$datetime</timestamp>\n";
    			print OUT "<source>$source</source>\n";
   			print OUT "<levelLogName>$levelLogName</levelLogName>\n";
    			print OUT "<sourceComputer>$sourceComputer</sourceComputer>\n";
    			print OUT "<user>$user</user>\n";
    			print OUT "<severityName>$severityName</severityName>\n";
    			print OUT "<eventID>$eventID</eventID>\n";
   			print OUT "<description>$description</description>\n";
   			print OUT "<processID>$processID</processID>\n";
    			print OUT "<threadID>$threadID</threadID>\n";
    			print OUT "<file>$file</file>\n";
    			print OUT "<line>$line</line>\n";
    			print OUT "</event>\n";
		}
	close(IN);
	}
	print OUT "</events>";
}
closedir(DIR);
close(OUT);
close(OUT2);

exit(0);
