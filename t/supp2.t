use strict;
use warnings;
use Math::GMPz qw(:mpz);

#$| = 1;
print "1..5\n";

print "# Using gmp version ", Math::GMPz::gmp_v(), "\n";

my $num = '98765432123' x 50;
my $m =  'f' x 100;

my $bnum = Rmpz_init_set_str($num, 10);
my $bm = Rmpz_init_set_str($m, 16);
my $q = Rmpz_init2(500);
my $r = Rmpz_init2(1500);
my $cq = Rmpz_init2(500);
my $cr = Rmpz_init2(1500);

Math::GMPz::Rmers_div_q($q, $bnum, $bm);
Math::GMPz::Rmers_div_r($r, $bnum, $bm);
Rmpz_tdiv_qr($cq, $cr, $bnum, $bm);

if(!Rmpz_cmp($cq, $q))
     {print "ok 1\n"}
else {print "not ok 1\n"}

if(!Rmpz_cmp($cr, $r))
     {print "ok 2\n"}
else {print "not ok 2\n"}

Math::GMPz::Rmers_div_qr($q, $r, $bnum, $bm);

if(!Rmpz_cmp($cq, $q)
   &&
   !Rmpz_cmp($cr, $r))
     {print "ok 3\n"}
else {print "not ok 3\n"}

Rmpz_set_str($q, '24691357819753088664246929963', 10);
Rmpz_set_str($r, '12345678909876544332123464983', 10);
Rmpz_set_str($cq, '12345678909876544332123464981', 10);

my $ok = '';
my @factors_ul = (2);
my @factors_gmp = ($cq);
for(1..75) {
    Rmpz_add_ui($r, $r, $_);
    Math::GMPz::Rgenerator_zp($r, $q, \@factors_ul, \@factors_gmp);
    $ok .= substr(Rmpz_get_str($r, 10), -1, 1);
    }

if($ok eq '514062955569262854567171622100371521865783605431145926287989136085221679262'){print "ok 4\n"}
else {print "not ok 4\n"}

$num = '';
for(1..60) {$num .= int(rand(2))}

Rmpz_set_str($q, $num, 2);

Math::GMPz::Rflipbit($r, $q);

Rmpz_and($r, $r, $q);
if(!Rmpz_cmp_ui($r, 0)) {print "ok 5\n"}
else {print "not ok 5\n"}