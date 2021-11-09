#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Server::Toaster::Defaults' ) || print "Bail out!\n";
}

diag( "Testing Server::Toaster::Defaults $Server::Toaster::Defaults::VERSION, Perl $], $^X" );
