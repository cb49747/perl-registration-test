#!/usr/bin/perl

sub GetParam {
 ##### set vars
 my $name     = $_[0];
 my $size     = $_[1];
 my $options  = $_[2];
 my $value;

 ##### get param requested.
 if ($name) { $value   = param($name); }
 else {my $value = ""; }

 ##### option 1 only allows letters and numbers and spaces and _ and -
 if ($options eq "1") { $value =~ s/[^A-Za-z0-9._\- ]*//g; }
 ##### option 2 here for everything.
 elsif ($options eq "2") { 1; }
 ##### option 3 only allows letters and numbers only
 elsif ($options eq "3") { $value =~ s/[^A-Za-z0-9]*//g; }
  ##### option 4 only allows letters only
 elsif ($options eq "4") { $value =~ s/[^A-Za-z]*//g; }
 ##### option 5 only allows numbers only
 elsif ($options eq "5") { $value =~ s/[^0-9]*//g; }
 ##### option 6 check password data allows letters, numbers, spaces, special chars(!@#$%^&*)
 elsif ($options eq "6") { $value =~ s/[^A-Za-z0-9!@#$%^&*]*//g; }
 ##### option 7 check email data allows letters, numbers,special chars(_@.)
 elsif ($options eq "7") { $value =~ s/[^A-Za-z0-9\-_@.]*//g; }
 ##### if option not listed use option 1 criteria
 else { $value =~ s/[^A-Za-z0-9._\- ]*//g; }

 ##### if size is 0 grab the whole field.
 if ($size eq "0") { 1; }
 ##### else grab the size requested.
 else { $value = substr($value, 0, $size); }

 ##### return safe value.
 return scalar $value;

 ##### sample useage - param name, param max length, 1 = letters and numbers and spaces only.
 #$sessionid = GetParam('sessionid', '60', '1');
}

sub OPEN_DATABASE {
	my $dsn_connect;
	my $dbh;

if (!$db_host && !$db_port) {
    $dsn_connect    = "DBI:mysql:database=$db_name";
}
else {
    $dsn_connect    = "DBI:mysql:database=$db_name;host=$db_host;port=$db_port";
}

	$dbh = DBI->connect( $dsn_connect, $db_user, $db_password )                  
		or die "Can't connect to my DB: $DBI::errstr\n";
		
		return $dbh;
}

sub Local_Date {

 my ($sec, $min, $hour, $day, $month, $year, $wday, $yday, $isdst) = localtime();

 my $datetime  = sprintf("%02d/%02d/%02d %02d:%02d:%02d", $year + 1900, $month + 1, $day, $hour, $min, $sec);

 return scalar $datetime;

}



1;