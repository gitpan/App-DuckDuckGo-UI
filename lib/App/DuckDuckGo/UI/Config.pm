package App::DuckDuckGo::UI::Config;
BEGIN {
  $App::DuckDuckGo::UI::Config::AUTHORITY = 'cpan:DDG';
}
{
  $App::DuckDuckGo::UI::Config::VERSION = '0.002';
}
# ABSTRACT: App::DuckDuckGo::UI configuration manager

use Config::Any;

my %defaults = (
    browser => "w3m %s",
    params => {},
    ssl => 1,
    debug => 0,
);

sub new {
    my %config = %defaults;

    my @files = Config::Any->load_stems({
            stems   => ["$ENV{XDG_CONFIG_HOME}/duckduckgo-ui", "./duckduckgo-ui"],
            use_ext => 1,
    });

    for my $file (@files) {
        my $cfg = $$file[0]->{(keys($$file[0]))[0]};
        $config{$_} = $$cfg{$_} for keys %$cfg;
    }

    return \%config;
}

1;
