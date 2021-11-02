package Server::Toaster;

use 5.006;
use strict;
use warnings;

=head1 NAME

Server::Toaster::Defaults - 

=head1 VERSION

Version 0.0.1

=cut

our $VERSION = '0.0.1';

=head1 SYNOPSIS

    use Server::Toaster::Defaults;
    use Data::Dumper;

    print Dumper Server::Toaster::Defaults->get;

=head1 METHODS

=head2 get

=cut

sub get {
	my $self = {
		ssl_ciphers =>
			'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384',
		ssl_min_protocol       => 'TLSv1.2',
		ssl_protocols_list     => [ 'SSLv3', 'TLSv1', 'TLSv1.1', 'TLSv1.2', 'TLSv1.3' ],
		ssl_session_tickets    => '0',
		ssl_honor_cipher_order => '0',
		server_admin_email     => 'you@foo.bar',
		server_admin_name      => 'Who Ever',
		ssl_cert_path          => '/usr/local/etc/letsencrypt/live/%%%DOMAN%%%/',
		Apache                 => {
			listen                 => [ '80', '443' ],
			http_port              => '80',
			https_port             => '443',
			server_root            => '/usr/local',
			default_https_redirect => '0',
			enable_https           => '0',
			ssl_stapling           => '1',
			ssl_stapling_cache     => 'shmcb:logs/ssl_stapling(32768)',
			modules                => {
				mpm_prefork      => '1',
				mpm_worker       => '0',
				mpm_event        => '0',
				authn_file       => '1',
				authn_dbm        => '0',
				authn_anon       => '0',
				authn_dbd        => '0',
				authn_core       => '1',
				authz_host       => '1',
				authz_groupfile  => '1',
				authz_dbm        => '0',
				authz_owner      => '0',
				authz_dbd        => '0',
				authnz_ldap      => '0',
				authz_core       => '0',
				access_compat    => '1',
				auth_basic       => "1",
				auth_form        => "0",
				auth_digest      => "0",
				allowmethods     => "0",
				file_cache       => "0",
				cache            => "0",
				cache_disk       => "0",
				cache_socache    => "0",
				socache_shmcb    => "0",
				socache_dbm      => "0",
				socache_memcache => "0",
				macro            => "0",
				dbd              => "0",
				dumpio           => "0",
				buffer           => "0",
				ratelimit        => "0",
				reqtimeout       => "1",
				ext_filter       => "0",
				request          => "0",
				include          => "0",
				filter           => "1",
				substitute       => "0",
				sed              => "0",
				deflate          => "1",
				mime             => "1",
				ldap             => "0",
				log_config       => "1",
				log_debug        => "0",
				logio            => "0",
				env              => "1",
				mime_magic       => "0",
				expires          => "0",
				headers          => "1",
				unique_id        => "0",
				setenvif         => "1",
				version          => "1",
				remoteip         => "1",
				proxy            => "1",
				proxy_connect    => "0",
				proxy_ftp        => "0",
				proxy_http       => "1",
				proxy_fcgi       => "1",
				proxy_scgi       => "1",
				proxy_wstunnel   => "1",
				proxy_ajp        => "0",
				proxy_balancer   => "0",
				proxy_express    => "0",
				session_module   => "0",
				session_cookie   => "0",
				session_crypto   => "0",
				session_dbd      => "0",
				slotmem_shm      => "0",
				ssl              => "1",
				lbmethod         => "0",
				lbmethod         => "0",
				lbmethod         => "0",
				unixd            => "1",
				dav              => "0",
				status           => "1",
				autoindex        => "1",
				asis             => "0",
				info             => "0",
				suexec           => "1",
				dav_fs           => "0",
				vhost_alias      => "1",
				negotiation      => "0",
				dir              => "1",
				imagemap         => "0",
				actions          => "1",
				speling          => "0",
				userdir          => "0",
				alias            => "1",
				rewrite          => "1",
				fcgid            => "1",
				fastcgi          => "1",
				wsgi             => "1",
				auth_openidc     => "1",
			},
			modules_d => 1,
			user      => 'www',
			group     => 'www',
								   doc_root  => '/usr/local/www/apache24/data',
								   cgi=>0,
			mpm_event => {
				StartServers           => 3,
				MinSpareThreads        => 75,
				MaxSpareThreads        => 250,
				ThreadsPerChild        => 25,
				MaxRequestWorkers      => 400,
				MaxConnectionsPerChild => 0
			},
			mpm_prefork => {
				StartServers           => 5,
				MinSpareServers        => 5,
				MaxSpareServers        => 10,
				MaxRequestWorkers      => 250,
				MaxConnectionsPerChild => 0,
			},
			mpm_worker => {
				StartServers           => 3,
				MinSpareThreads        => 75,
				MaxSpareThreads        => 250,
				ThreadsPerChild        => 25,
				MaxRequestWorkers      => 400,
				MaxConnectionsPerChild => 0,

			}
		}
	};
	bless $self;

	return $self;
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
