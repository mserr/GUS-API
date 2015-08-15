#! /usr/bin/perl -w

use lib '../lib';
use Modern::Perl;
use GUS::API qw(login get_captcha captcha2jpeg);


my $session_id = login('gopo49n9gbj303og6ny7');
say 'Your session id: '.$session_id;

my $captcha = get_captcha($session_id); 
say 'Read your numbers:';
say $captcha;

say 'You will find decoded picture at /tmp/decoded_captcha.jpg';
captcha2jpeg($captcha, '/tmp/decoded_captcha.jpg');
