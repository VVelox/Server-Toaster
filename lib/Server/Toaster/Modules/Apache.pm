package Server::Toaster::Modules::Apache;

use 5.006;
use strict;
use warnings;
use Moose;
extends 'Server::Toaster::Modules::Base';

=head1 NAME

Server::Toaster::Modules::Apache - Apache module for Server::Toaster

=head1 VERSION

Version 0.0.1

=cut

our $VERSION = '0.0.1';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Server::Toaster::Modules::Apache;
    
    my $st = Server::Toaster->new();
    
    

=head1 METHODS

=head2 fill_in

This filles in the templates.

The required values are as below.

    hostname - The hostname of the system being processed.
    
    config - The config hash ref for the use with filling the templates.

This will die upon error.

=cut

sub fill_in {
	my ( $self, %opts ) = @_;

	# make sure we have a hostname
	if ( !defined( $opts{hostname} ) ) {
		die('No hostname defined');
	}

	# make sure we have a config to use
	if ( !defined( $opts{config} ) ) {
		die('No config defined');
	}

	my $vars = {
		hostname => $opts{hostname},
		d        => Server::Toaster::Defaults->get,
		c        => %opts{config},
	};

}

=head2 get_files_module

Fetches a list of templates a module uses.

The returned value is a hash with the keys being the template names
and the value being the full path to the file.

=cut

sub get_files_module {
	return (
			'Apache/domain.tt',
			'Apache/httpd.conf.tt'
			);
}

=head1 AUTHOR

Zane C. Bowers-Hadley, C<< <vvelox at vvelox.net> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-server-toaster at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Server-Toaster>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Server::Toaster


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Server-Toaster>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/Server-Toaster>

=item * Search CPAN

L<https://metacpan.org/release/Server-Toaster>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2021 by Zane C. Bowers-Hadley.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)


=cut

1;    # End of Server::Toaster
