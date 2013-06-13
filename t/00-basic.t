# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl SourceCode-Spellcheck.t'

#########################

use Test::More tests => 6;
BEGIN { use_ok('Sourcecode::Spellchecker') };

# Test that the appropriate methods exist
can_ok('Sourcecode::Spellchecker', qw(new spellcheck));

my $checker = Sourcecode::Spellchecker->new({'hootdog' => 'hotdog'});

my @results = $checker->spellcheck('t/test.cpp');
is(scalar(@results), 6);

is($results[0]->{line}, 4);
is($results[0]->{misspelling}, 'farenheit');
is($results[0]->{correction}, 'Fahrenheit');



