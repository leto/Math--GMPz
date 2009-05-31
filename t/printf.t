use warnings;
use strict;
use Math::GMPz qw(:mpz);
use Math::BigInt; # for some error checks

print "1..6\n";

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
        else {warn "1a got: $_\n"}
     }
     if($. == 2) {
       if($_ =~ /A string and an mpz object in hex: \-12D686/i) {$ok .= 'b'}
        else {warn "1b got: $_\n"}
     }
}

while(<RD2>) {
     chomp;
     if($. == 1) {
       if($_ eq 'An mpz object: -1234566 followed by a signed int: -16 followed by an unsigned long: 56790') {$ok .= 'c'}
        else {warn "1c got: $_\n"}
     }
     if($. == 2) {
       if($_ =~ /A string and an mpz object in hex: \-12D685/i) {$ok .= 'd'}
        else {warn "1d got: $_\n"}
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
else {warn "2a got: $buf\n"}

$buf = $buffer;
$mpz *= -1;

my $ret = Rmpz_sprintf_ret($buf, "The mpz object: %Zd", $mpz);
if ($ret eq 'The mpz object: 1234565') {$ok .= 'b'}
else {warn "2b got: $ret\n"}
if ($buf eq 'The mpz object: 1234565' . "\0" . 'XOXO' x 4) {$ok .= 'c'}
else {warn "2c got: $buf\n"}


if($ok eq 'abc') {print "ok 2\n"}
else {print "not ok 2 $ok\n"}

$ok = '';

my $mbi = Math::BigInt->new(123);
eval {Rmpz_printf("%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'a'}
else {warn "3a got: $@\n"}

eval {Rmpz_fprintf(\*STDOUT, "%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'b'}
else {warn "3b got: $@\n"}

eval {Rmpz_sprintf($buf, "%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'c'}
else {warn "3c got: $@\n"}

eval {Rmpz_sprintf_ret($buf, "%Zd", $mbi);};
if($@ =~ /Unrecognised object/) {$ok .= 'd'}
else {warn "3d got: $@\n"}

eval {Rmpz_fprintf(\*STDOUT, "%Zd", $mbi, $ul);};
if($@ =~ /must take 3 arguments/) {$ok .= 'e'}
else {warn "3e got: $@\n"}

eval {Rmpz_sprintf($buf, "%Zd", $mbi, $ul);};
if($@ =~ /must take 3 arguments/) {$ok .= 'f'}
else {warn "3f got: $@\n"}

eval {Rmpz_sprintf_ret("%Zd", $mbi);};
if($@ =~ /must take 3 arguments/) {$ok .= 'g'}
else {warn "3g got: $@\n"}

eval {Rmpz_printf("%Zd", $mbi, $ul);};
if($@ =~ /must take 2 arguments/) {$ok .= 'h'}
else {warn "3h got: $@\n"}

if($ok eq 'abcdefgh') {print "ok 3\n"}
else {print "not ok 3 $ok\n"}                                                                                                                                                                                                                                          

$ok = '';

$ret = Rmpz_printf("40%% of %Zd", $mpz);
if($ret == 14) {$ok .= 'a'}

my $w = 10;

$ret = Rmpz_printf("40%% of %${w}Zd", $mpz);
if($ret == 17) {$ok .= 'b'}

$ret = Rmpz_printf("$string of %${w}Zd", $mpz);
if($ret == 22) {$ok .= 'c'}

$ret = Rmpz_printf("$ul of %${w}Zd", $mpz);
if($ret == 19) {$ok .= 'd'}

if($ok eq 'abcd') {print "\nok 4\n"}
else {print "not ok 4 $ok\n"}

eval{require Math::GMPq;};
if(!$@) {
  my $ok = '';
  my $mpz = Math::GMPq->new(1234567);

  my $ret = Rmpz_printf("40%% of %Qd", $mpz);
  if($ret == 14) {$ok .= 'a'}

  my $w = 10;

  $ret = Rmpz_printf("40%% of %${w}Qd", $mpz);
  if($ret == 17) {$ok .= 'b'}

  $ret = Rmpz_printf("$string of %${w}Qd", $mpz);
  if($ret == 22) {$ok .= 'c'}

  $ret = Rmpz_printf("$ul of %${w}Qd", $mpz);
  if($ret == 19) {$ok .= 'd'}

  if($ok eq 'abcd') {print "\nok 5\n"}
  else {print "not ok 5 $ok\n"}
}
else {
  warn "Skipping test 5 - Math::GMPq not available\n";
  print "ok 5\n";
}

eval{require Math::GMPf;};
if(!$@) {
  my $ok = '';
  my $mpz = Math::GMPf->new(1234567);
  my $ret = Rmpz_printf("40%% of %Ff", $mpz);
  if($ret == 21) {$ok .= 'a'}

  my $w = 16;

  $ret = Rmpz_printf("40%% of %${w}Ff", $mpz);
  if($ret == 23) {$ok .= 'b'}

  $ret = Rmpz_printf("$string of %${w}Ff", $mpz);
  if($ret == 28) {$ok .= 'c'}

  $ret = Rmpz_printf("$ul of %${w}Ff", $mpz);
  if($ret == 25) {$ok .= 'd'}

  if($ok eq 'abcd') {print "\nok 6\n"}
  else {print "not ok 6 $ok\n"}
}
else {
  warn "Skipping test 6 - Math::GMPf not available\n";
  print "ok 6\n";
}

