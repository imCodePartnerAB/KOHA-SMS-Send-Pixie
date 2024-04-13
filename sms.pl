#!/usr/bin/perl

use C4::SMS;
use Modern::Perl;
use DateTime;
use utf8;

my $dt = DateTime->now;

if (scalar(@ARGV) != 1) {
    die "Usage: $0 <phonenumer with landcode>\n";
}

my $arg = $ARGV[0];

say C4::SMS->send_sms( {
    destination => "$arg",
    message     => "test æøå ÆØÅ åäö ÅÄÖ $dt",
} );