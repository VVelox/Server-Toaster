use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;
use File::ShareDir::Install;

my %WriteMakefileArgs = (
	NAME               => 'Server::Toaster',
	AUTHOR             => q{Zane C. Bowers-Hadley <vvelox@vvelox.net>},
	VERSION_FROM       => 'lib/Server/Toaster.pm',
	ABSTRACT_FROM      => 'lib/Server/Toaster.pm',
	LICENSE            => 'artistic_2',
	MIN_PERL_VERSION   => '5.006',
	CONFIGURE_REQUIRES => {
		'ExtUtils::MakeMaker'     => '0',
		'File::ShareDir::Install' => '0',
	},
	TEST_REQUIRES => {
		'Test::More' => '0',
	},
	PREREQ_PM => {
		'Template'               => '3.009',
		'Template::Plugin::JSON' => '0.08',
		'File::ShareDir'         => '0',
	},
	dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean => { FILES    => 'Server-Toaster-*' },
);

# Compatibility with old versions of ExtUtils::MakeMaker
unless ( eval { ExtUtils::MakeMaker->VERSION('6.64'); 1 } ) {
	my $test_requires = delete $WriteMakefileArgs{TEST_REQUIRES} || {};
	@{ $WriteMakefileArgs{PREREQ_PM} }{ keys %$test_requires } = values %$test_requires;
}

unless ( eval { ExtUtils::MakeMaker->VERSION('6.55_03'); 1 } ) {
	my $build_requires = delete $WriteMakefileArgs{BUILD_REQUIRES} || {};
	@{ $WriteMakefileArgs{PREREQ_PM} }{ keys %$build_requires } = values %$build_requires;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
	unless eval { ExtUtils::MakeMaker->VERSION('6.52'); 1 };
delete $WriteMakefileArgs{MIN_PERL_VERSION}
	unless eval { ExtUtils::MakeMaker->VERSION('6.48'); 1 };
delete $WriteMakefileArgs{LICENSE}
	unless eval { ExtUtils::MakeMaker->VERSION('6.31'); 1 };

install_share 'share';

WriteMakefile(%WriteMakefileArgs);

package MY;
use File::ShareDir::Install qw( postamble );
