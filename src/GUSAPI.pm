#! /usr/bin/perl -w

use Modern::Perl;
use LWP;
use Data::Dumper;
use JSON;
use MIME::Base64;
use XML::Simple;

my $url = "https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc/ajaxEndpoint/Zaloguj";
my $urlc = "https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc/ajaxEndpoint/PobierzCaptcha";
my $urlcheck = "https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc/ajaxEndpoint/SprawdzCaptcha";
my $urlsearch = "https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/UslugaBIRzewnPubl.svc/ajaxEndpoint/DaneSzukaj";
#my $url = "https://wyszukiwarkaregontest.stat.gov.pl/wsBIR/wsdl/UslugaBIRzewnPubl.xsd";
my $json = {"pKluczUzytkownika" => 'gopo49n9gbj303og6ny7'};
my $ua = LWP::UserAgent->new; # You might want some options here


#POBIERZ NR SESJI
my $req = HTTP::Request->new(POST => $url);
$req->content_type('application/json');
$req->content('{"pKluczUzytkownika":"gopo49n9gbj303og6ny7"}');
my $res = $ua->request($req);
my $jsres = from_json( $res->{_content} );
#say Dumper($jsres->{d});


# POBIERZ CAPTCHA
$req = HTTP::Request->new(POST => $urlc);
$req->header('sid' => $jsres->{d});
$req->content_type('application/json');
$req->content('{}');
$res = $ua->request($req);
my $jscaptcha = from_json($res->{_content});

my $decoded = MIME::Base64::decode_base64($jscaptcha->{d});
open my $fh, ">captcha.jpg";
binmode $fh;
print $fh $decoded;
close $fh;

# SPRAWDZ CAPTCHA;

$req = HTTP::Request->new(POST => $urlcheck);
$req->header('sid' => $jsres->{d});
$req->content_type('application/json');
$req->content('{"pCaptcha":"aaaaa"}');
$res = $ua->request($req);
#my $jscaptcha = from_json($res->{_content});

# SZUKAJ DANYCH
$req = HTTP::Request->new(POST => $urlsearch);
$req->header('sid' => $jsres->{d});
$req->content_type('application/json');
$req->content('{"pParametryWyszukiwania":{"Nip":"1251559805"}}');
$res = $ua->request($req);

# PRZEROB XMLA
my $jsondata = from_json($res->{_content});
#say Dumper($jsondata->{d});
$res = XMLin($jsondata->{d});
say Dumper($res);


#say Dumper($res->{_content});


# $res is an HTTP::Response, see the usual LWP docs.
