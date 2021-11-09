#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Server::Toaster::Modules::Apache' ) || print "Bail out!\n";
}

diag( "Testing Server::Toaster::Modules::Apache $Server::Toaster::Modules::Apache::VERSION, Perl $], $^X" );
