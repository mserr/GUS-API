use Test::More tests => 1;

use lib '../lib';

BEGIN {
use_ok( 'GUS::API' );
}

diag( "Testing GUS::API $GUS::API::VERSION" );
