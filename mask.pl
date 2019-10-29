#!/bin/perl -w
use NetAddr::IP ;

#--------------------------------------------------------------------------------
#.D: mask - given an ip address/mask print out details of ip network range
#--------------------------------------------------------------------------------
my $ip = shift ;
if ( ! $ip ) {
        print "\nUsage: $0 x.x.x.x/x.x.x.x \n" ;
        print "   or  $0 x.x.x.x/xx\n" ;
        die "\nMust supply an IP address on the command line \n" ;
}
if ( $ip !~ ?/? ) {
        print "\nIncorrect IP address format, only the following can be specified:-\n" ;
        print "          x.x.x.x/x.x.x.x \n" ;
        print "   or     x.x.x.x/xx\n" ;
        die "\nMust supply an IP address on the command line \n" ;
}
chomp $ip ;
my $IP = new NetAddr::IP $ip ;
my @IP1 = $IP->numeric ;

print "Number of host addresses:        ", $IP->num(), "\n";

printf "Subnet Address:                 %-15s (%X)
Broadcast Address:              %-15s (%X)
Subnet Mask:                    %-15s (%X)
Network Filter:                 %-15s  %s

",
        $IP->network()->addr,
        scalar $IP->network()->numeric,
        $IP->broadcast()->addr,
        scalar $IP->broadcast()->numeric,
        $IP->mask(),
        $IP1[1] ,
        $IP->network()->addr,
        scalar $IP->wildcard;
