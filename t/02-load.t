#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Server::Toaster::Modules::Base' ) || print "Bail out!\n";
}

diag( "Testing Server::Toaster::Modules::Base $Server::Toaster::Modules::Base::VERSION, Perl $], $^X" );
