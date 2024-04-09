use 5.030000;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'SMS::Send::Pixie',
    VERSION_FROM      => 'lib/SMS/Send/Pixie.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/SMS/Send/Pixie.pm', # retrieve abstract from module
    AUTHOR            => 'Magnus Pettersson (magnus.pettersson@imcode.com)',
);
