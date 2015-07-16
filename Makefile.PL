use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'GUS::API',
    AUTHOR              => '<Michał Górski> <<michalmarcingorski@gmail.com>>',
    VERSION_FROM        => 'lib/GUS/API.pm',
    ABSTRACT_FROM       => 'lib/GUS/API.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'GUS-API-*' },
);
