

<p align="center">
  <a href="https://github.com/imCodePartnerAB/KOHA-SMS-Send-Pixie">
    <img src="https://icm.imcode.com/images/logo.gif" alt="Logo" width="432" height="70">
  </a>

<h3 align="center">SMS-Send-Pixie</h3>

<p align="center">SMS Driver for Pixie</p>





## Table of Content

* [About](#about)

* [Installation](#installation)

* [Configuration](#configuration)

* [About me and us](#about-me-and-us)

  

## About

This is a Perl SMS driver writen for Koha, but it should work for any SMS::Send usage. The driver is written for Pixie and the api found in the following document: 



## Installation

1. Clone this project
2. Run "perl Makepage.PL"
3. Run "make"
4. Run "make test" (Optional)
5. Run "make install"

The driver should now be installed. You can test it with runing the sms.pl as shown belove.

## Configuration

For KOHA, under Administration search for SMSSendDriver and you will get two hits.

We want to set SMSSendDriver to Pixie, like this.

SMSSendDriver=Pixie

**You don't need to set this values, they are not  used**

SMSSendUsername=
SMSSendPassword=




## Test koha
You can test koha with the sms.pl. Add a phonenumber to the file and run it by **sudo koha-shell -c "perl sms.pl" \<instance>**



```perl
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
```



## About me and us
I work for imCode AB which is a Swedish company specialized in advanced
web-services, mostly for big organizations and municipalities services.

Here I work mainly as system developer and most of my time is managing
servers and applications running on these. From time to time I also get
to work with system level programming and other programming to make
life easier for customers and our other developers.

However if you contact me with a case or request we have very competent
people both in our office in Sweden and abroad; And I would love to help
anyone with their idea or request, and even if I'm not the man for the job
im sure I would be able to find the right person for your case. If it is
internet service/application related of course.
