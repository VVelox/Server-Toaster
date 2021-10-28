#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Server::Toaster' ) || print "Bail out!\n";
}

diag( "Testing Server::Toaster $Server::Toaster::VERSION, Perl $], $^X" );
