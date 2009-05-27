use warnings;
use strict;
use Math::GMPz qw(:mpz);
use Math::BigInt; # for some error checks

print "1..3\n";

print "# Using gmp version ", Math::GMPz::gmp_v(), "\n";

open(WR1, '>', 'out1.txt') or die "Can't open WR1: $!";
open(WR2, '>', 'out2.txt') or die "Can't open WR2: $!";

my $mpz = Math::GMPz->new(-1234567);
my $int = -17;
my $ul = 56789;
my $string = "A string";

Rmpz_fprintf(\*WR1, "An mpz object: %Zd ", $mpz);
$mpz++;
Rmpz_fprintf(\*WR2, "An mpz object: %Zd ", $mpz);

Rmpz_fprintf(\*WR1, "followed by a signed int: %d ", $int);
$int++;
Rmpz_fprintf(\*WR2, "followed by a signed int: %d ", $int);

Rmpz_fprintf(\*WR1, "followed by an unsigned long: %u\n", $ul);
$ul++;
Rmpz_fprintf(\*WR2, "followed by an unsigned long: %u\n", $ul);

Rmpz_fprintf(\*WR1, "%s ", $string);
Rmpz_fprintf(\*WR2, "%s ", $string);

Rmpz_fprintf(\*WR1, "and an mpz object in hex: %Zx\n", $mpz);
$mpz++;
Rmpz_fprintf(\*WR2, "and an mpz object in hex: %Zx\n", $mpz);

close(WR1) or die "Can't close WR1: $!";
close(WR2) or die "Can't close WR2: $!";
open(RD1, '<', 'out1.txt') or die "Can't open RD1: $!";
open(RD2, '<', 'out2.txt') or die "Can't open RD2: $!";

my $ok;

while(<RD1>) {
     chomp;
     if($. == 1) {
       if($_ eq 'An mpz object: -1234567 followed by a signed int: -17 followed by an unsigned long: 56789') {$ok .= 'a'}
        else {print "1a got: $_\n"}
     }
     if($. == 2) {
       if($_ =~ /A string and an mpz object in hex: \-12D686/i) {$ok .= 'b'}
        else {print "1b got: $_\n"}
     }
}

while(<RD2>) {
     chomp;
     if($. == 1) {
       if($_ eq 'An mpz object: -1234566 followed by a signed int: -16 followed by an unsigned long: 56790') {$ok .= 'c'}
        else {print "1c got: $_\n"}
     }
     if($. == 2) {
       if($_ =~ /A string and an mpz object in hex: \-12D685/i) {$ok .= 'd'}
        else {print "1d got: $_\n"}
     }
}

close(RD1) or die "Can't close RD1: $!";
close(RD2) or die "Can't close RD2: $!";

if($ok eq 'abcd') {print "ok 1\n"}
else {print "not ok 1 $ok\n"}

$ok = '';
my $buffer = 'XOXO' x 10;
my $buf = $buffer;

Rmpz_sprintf($buf, "The mpz object: %Zd", $mpz);
if ($buf eq 'The mpz object: -1234565') {$ok .= 'a'}
else {print "2a got: $buf\n"}

$buf = $buffer;
$mpz *= -1;

my $ret = Rmpz_sprintf_ret($buf, "The mpz object: %Zd", $mpz);
if ($ret eq 'The mpz object: 1234565') {$ok .= 'b'}
else {print "2b got: $ret\n"}
if ($buf eq 'The mpz object: 1234565' . "\0" . 'XOXO' x 4) {$ok .= 'c'}
else {print "2c got: $buf\n"}


if($ok eq 'abc') {print "ok 2\n"}
else {print "not ok 2 $ok\n"}

$ok = '';

my $mbi = Math::BigInt->new(123);
eval {Rmpz_printf("%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'a'}
else {print "3a got: $@\n"}

eval {Rmpz_fprintf(\*STDOUT, "%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'b'}
else {print "3b got: $@\n"}

eval {Rmpz_sprintf($buf, "%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'c'}
else {print "3c got: $@\n"}

eval {Rmpz_sprintf_ret($buf, "%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'd'}
else {print "3d got: $@\n"}

eval {Rmpz_fprintf(\*STDOUT, "%Zd", $mbi, $ul);};
if($@ =~ /must take 3 arguments/) {$ok .= 'e'}
else {print "3e got: $@\n"}

eval {Rmpz_sprintf($buf, "%Zd", $mbi, $ul);};
if($@ =~ /must take 3 arguments/) {$ok .= 'f'}
else {print "3f got: $@\n"}

eval {Rmpz_sprintf_ret("%Zd", $mbi);};
if($@ =~ /must take 3 arguments/) {$ok .= 'g'}
else {print "3g got: $@\n"}

if($ok eq 'abcdefg') {print "ok 3\n"}
else {print "not ok 3 $ok\n"}

$ok = '';

