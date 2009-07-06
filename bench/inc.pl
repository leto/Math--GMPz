#!/usr/bin/perl5.10 -w

use strict;
use Benchmark;
use Math::GMPz qw/:mpz/;
$|++;

my $x = Math::GMPz->new(100);

my $count = shift || 10_000_000;

# low-level seems to be around 10x faster
timethese($count,{
    'low-level' => sub { Rmpz_add_ui($x,$x,1) },
    '++ op overload' => sub { $x++ },
    '+ op overload' => sub { $x = $x + 1 },
});
