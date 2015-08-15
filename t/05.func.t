use Test::More ;
use lib '../lib';
use  GUS::API qw/login get_captcha captcha2jpeg/;

my $user_key = 'gopo49n9gbj303og6ny7';

my $session_id = login($user_key);
ok( length( $session_id ) == 20,'Login ok.' ); 

my $captcha = get_captcha($session_id);
ok( length($captcha)  > 20,'got encoded captcha.' ); 

captcha2jpeg($captcha);
ok( -e '/tmp/gus_captcha.jpg' , 'captcha2jpeg' );

done_testing();