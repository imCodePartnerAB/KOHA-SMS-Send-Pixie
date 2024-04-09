package SMS::Send::Pixie;

use strict;
use warnings;

use JSON;
use LWP::UserAgent;
use HTTP::Request;
use Data::Dumper;
use Modern::Perl;

use utf8;
use base 'SMS::Send::Driver';

our $VERSION = '0.01';
our $DEBUG = '0';

sub new {
   my ($class, %args) = @_;
    
   say Dumper \%args if $DEBUG;

   my $self = bless {
      login => $args{_login},
      password => $args{_password},
      url => $args{_url},
      sender => $args{_sender},
      bearer => $args{_bearer},
   };
}

sub send_sms {
    my ($class, %args) = @_;

    my $self = shift;
    
    say Dumper \%args if $DEBUG;
    say Dumper $self if $DEBUG;

    my $recipients = [$args{to}];
    my $message = $args{text};
    
    my $bearer = $self->{bearer}; 
    my $url = $self->{url};
    my $sender = $self->{sender};

    my $ua = LWP::UserAgent->new(
        protocols_allowed => ['https'],
        timeout           => 10,
        ssl_opts          => { verify_hostname => 1 }
    );

    my $json_payload = {
        sender => "$sender",
        message => $message,
        recipients => $recipients
    };

    my $json_data = encode_json($json_payload);

    my $req = HTTP::Request->new(POST => $url);
    $req->header('Content-Type' => 'application/json');
    $req->header('accept' => 'application/json');
    $req->header('Authorization' => $bearer);
    $req->content($json_data);

    my $response = $ua->request($req);

    if ($response->is_success) {
        return 1;
    } else {
        warn "HTTP POST request failed: " . $response->status_line;
        return 0;
    }
}

1;
