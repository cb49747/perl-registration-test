#!/usr/bin/perl

require 'config.conf';
require 'lib/main.pl';

use strict;
use warnings;
use Template;
use CGI qw(:standard);                                                                   
use CGI::Carp 'fatalsToBrowser';
use DBI;

my $firstname = GetParam('firstname', '25', '1');
my $lastname  = GetParam('lastname', '25', '1');
my $address1  = GetParam('address1', '45', '1');
my $address2  = GetParam('address2', '45', '1');
my $city      = GetParam('city', '25', '1');
my $state     = GetParam('state', '2', '4');
my $zip       = GetParam('zip', '9', '5');
my $country   = GetParam('country', '2', '4');
my $registerDate = Local_Date();

if (!$firstname || !$lastname || !$address1 || !$city || !$state || !$zip) {
	
	my $tt = Template->new({
			RELATIVE => 1,
	});
	my $input = $main::templatePath . "main/register.tt2"; 
	my $vars = {
		template_path => $main::templatePath
	};  

	print "Content-type: text/html\n\n";
	$tt->process($input,$vars) || die $tt->error();	
}

else {
	my $dbh = OPEN_DATABASE();
	
	my $sth1 = $dbh->prepare( "INSERT INTO registration VALUES (null, '$firstname', '$lastname', '$address1', '$address2', '$city', '$state', '$zip', '$country', '$registerDate')" );
	   $sth1->execute();
	   $sth1->finish();	

	my $tt = Template->new({
			RELATIVE => 1,
	});
	my $input = $main::templatePath . "main/register_done.tt2"; 
	my $vars = {
		template_path => $main::templatePath,
		firstname => $firstname,
		lastname => $lastname,
		address1 => $address1,
		address2 => $address2,
		city => $city,
		state => $state,
		zip => $zip,
		country => $country,
		registerDate => $registerDate
	};
	
	print "Content-type: text/html\n\n";
	$tt->process($input,$vars) || die $tt->error();	
}

exit;