#!/usr/bin/perl

require 'config.conf';
require 'lib/main.pl';

use strict;
use warnings;
use Template;
use CGI qw(:standard);                                                                   
use CGI::Carp 'fatalsToBrowser';
use DBI;

my $dbh = OPEN_DATABASE();

my @allRegistrations;
print "Content-type: text/html\n\n";	
my $sth = $dbh->prepare( "SELECT * FROM  registration ORDER BY date_registered DESC" );	
	 $sth->execute();
	 	  while (my @row = $sth->fetchrow_array) {
			my %registration = (
				id => $row[0], 
				firstname => $row[1],
				lastname => $row[2],
				address1 => $row[3],
				address2 => $row[4],
				city => $row[5],
				state => $row[6],
				zip => $row[7],
				country => $row[8],
				registerdate => $row[9]
		    ); 
		    push(@allRegistrations, \%registration);	  	
	 	  }
	 $sth->finish();	

my $tt = Template->new({
	RELATIVE => 1,
});
my $input = $main::templatePath . "main/register_userreport.tt2";  

my $vars = {
		template_path => $main::templatePath,
		allRegistrations => \@allRegistrations
};
	
#print "Content-type: text/html\n\n";
#my $i;
#foreach $i (keys @allRegistrations) { print $allRegistrations[$i]{'firstname'}; }
$tt->process($input,$vars) || die $tt->error();	

exit;