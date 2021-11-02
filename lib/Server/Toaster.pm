package Server::Toaster;

use 5.006;
use strict;
use warnings;
use Template;
use File::ShareDir ':ALL';

=head1 NAME

Server::Toaster - Helper for generating templated config files for servers.

=head1 VERSION

Version 0.0.1

=cut

our $VERSION = '0.0.1';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Server::Toaster;
    
    my $st = Server::Toaster->new();
    
    

=head1 METHODS

=head2 new

This initiates the module.

    dir - The base dir to use. If not spoecified,
          'stoaster' is ued.
    
    output - The output dir to use. If not specified,
             $dir.'/output' is used.
    
    templates - The template dir to use. If not specified,
                $dir.'/templates' is used.

$templates and $output will be created as needed, but $dir must
exist upon module init or it will die.


=cut

sub new {
	my ( $blank, %opts ) = @_;

	# set the default dir if non is specified
	if ( !defined( $opts{dir} ) ) {
		$opts{dir} = 'stoaster';
	}

	# die if the base dir is not a directory or does not exist
	if ( !-d $opts{dir} ) {
		die '"' . $opts{dir} . '" does not exist or is not a directory';
	}

	# set the default output dir if non is specified
	if ( !defined( $opts{output} ) ) {
		$opts{output} = $opts{dir} . '/output';
	}

	# set the default template dir if non is specified
	if ( !defined( $opts{templates} ) ) {
		$opts{templates} = $opts{dir} . '/templates';
	}

	# init the object
	my $self = {
		dir       => $opts{dir},
		output    => $opts{output},
		templates => $opts{templates},
		share     => dist_dir('Server-Toaster'),
	};
	bless $self;

	return $self;
}

=head2 fill_in

This filles in the templates for the specified module.

The required values are as below.

    module - The module to process the templates for.
    
    hostname - The hostname of the system being processed.
    
    config - The config hash ref for the use with filling the templates.

This will die upon error.

=cut

sub fill_in {
	my ( $blank, %opts ) = @_;

}

=head2 get_files

Fetches a list of templates a module uses.

As long as the specified module exists, this should never die.

The returned value is a hash with the keys being the template names
and the value being the full path to the file.
sq
One value is required and that is the name of the module, relevant to
Sever::Toaster::Modules. So 'Sever::Toaster::Modules::Apache' becomes
'Apache';

=cut

sub get_files {
	my ( $blank, $module ) = @_;

	# make sure we have a module defined
	if ( !defined($module) ) {
		die 'No module specified';
	}

	my %returned;
	my $to_eval
		= 'use Server::Toaster::Modules::'
		. $module
		. '; %returned=Server::Toaster::Modules::'
		. $module
		. '->get_files;';
	eval( $to_eval );

	return %returned;
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
