use strict;
use warnings;
use Test2::V0;
use Test2::Tools::Class qw[isa_ok can_ok];
#
BEGIN { chdir '../' if !-d 't'; }
use lib '../lib', 'lib', '../blib/arch', '../blib/lib', 'blib/arch', 'blib/lib', '../../', '.';
#
use At;
#
subtest 'live' => sub {
    my $at = At->new( host => 'bsky.social' );
    isa_ok $at->listRepos->{repos}[0], ['At::Lexicon::com::atproto::sync::repo'];

    # Do not run these tests; they might not be supported upstream...
    can_ok $at, $_ for qw[getBlocks getLatestCommit getRecord getRepo listBlobs notifyOfUpdate requestCrawl getBlob
        subscribeRepos
        subscribeRepos_p];
};
#
done_testing;

