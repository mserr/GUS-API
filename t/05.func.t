use Test::More tests => 1;
use lib '../lib';
use  GUS::API qw/login/;

my $user_key = 'gopo49n9gbj303og6ny7';

my $session_id = login($user_key);
print "$session_id\n";
cmp_ok( length( $session_id ),'==',20,'Login ok.' ); 
