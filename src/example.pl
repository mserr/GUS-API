#! /usr/bin/perl -w

use lib '../lib';
use Modern::Perl;
use GUS::API qw(login get_captcha);


my $session_id = login('gopo49n9gbj303og6ny7');
say 'Your session id: '.$session_id;

my $captcha = get_captcha($session_id); 
say 'Read your numbers:';
say $captcha;
