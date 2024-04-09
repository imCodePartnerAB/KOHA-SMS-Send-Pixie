#!/usr/bin/perl

use C4::SMS;
use Modern::Perl;
use DateTime;
use utf8;

my $dt = DateTime->now;

say C4::SMS->send_sms( {
    destination => "+46...",
    message     => "test æøå ÆØÅ åäö ÅÄÖ $dt",
} );

