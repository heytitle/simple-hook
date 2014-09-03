#!/usr/bin/env perl
use Plack::App::GitHub::WebHook;
use Plack::Builder;
use Config::ZOMG;

use constant {
    CONFIG_FILE => 'webhook.yaml',
    LOG => 'last-update.txt'
};

my $config = Config::ZOMG->new( file => CONFIG_FILE )->load;

my $app = Plack::App::GitHub::WebHook->new(
    hook => [
        sub {
            ## execute command
            my $commands = $config->{commands};
            my $root = $config->{repo_path};
            my $log = LOG;

            my $commands = join( ' && ', ( "cd $root", @{ $commands }, "date > $log" ) );

            `$commands`;

            return 1;
        }
    ]
)->to_app;

builder {
    mount '/' => builder {
        enable_if { $_[0]->{REMOTE_ADDR} eq '127.0.0.1' } "Plack::Middleware::ReverseProxy";
        $app;
    };
};
