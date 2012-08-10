use 5.012004;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Finance::NASDAQ::Markets',
    VERSION_FROM      => 'lib/Finance/NASDAQ/Markets.pm', # finds $VERSION
    PREREQ_PM         => {
      # Require Test::More at least 0.47
        "LWP::Simple" => 0,
        "HTML::TableExtract" => 0,
        "HTML::TableContentParser" =>0,
    
    }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Finance/NASDAQ/Markets.pm', # retrieve abstract from module
       AUTHOR         => 'hagen geissler <santex@cpan.org>') : ()),
);


