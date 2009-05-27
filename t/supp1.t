use strict;
use warnings;
use Math::GMPz qw(:mpz);

#$| = 1;
print "1..5\n";

print "# Using gmp version ", Math::GMPz::gmp_v(), "\n";

my ($q, $d, $e, $n);
my $str = '1' x 181;
my $p = Rmpz_init2(200);
my $z = Rmpz_init2(200);
$q = Rmpz_init();

Rmpz_set_str($p, $str, 2);

my $ok = Math::GMPz::Rparity_gmp($p);
Rmpz_clrbit($p, 0);

my $nok = Math::GMPz::Rparity_gmp($p);

if($ok && !$nok)
     {print "ok 1\n"}
else {print "not ok 1\n"}

if(!Math::GMPz::Rparity_ul(65535) && Math::GMPz::Rparity_ul(65534))
     {print "ok 2\n"}
else {print "not ok 2\n"}

my $num = 0b11101010110010111001;
my $s = 20;
my $c = $num;

my @ok = ();

$num = Math::GMPz::Rrotate_left_ul($num, $s, 17);
$num = Math::GMPz::Rrotate_right_ul($num, $s, 17);

if($num eq $c) {push @ok, 1}
else {push @ok, 0}

$num = Math::GMPz::Rrotate_right_ul($num, $s, 15);
$num = Math::GMPz::Rrotate_left_ul($num, $s, 15);

if($num eq $c) {push @ok, 1}
else {push @ok, 0}

$num = Math::GMPz::Rrotate_left_ul($num, $s, 3);
$num = Math::GMPz::Rrotate_left_ul($num, $s, 4);
$num = Math::GMPz::Rrotate_left_ul($num, $s, 6);
$num = Math::GMPz::Rrotate_left_ul($num, $s, 7);

if($num eq $c) {push @ok, 1}
else {push @ok, 0}

$num = Math::GMPz::Rrotate_right_ul($num, $s, 3);
$num = Math::GMPz::Rrotate_right_ul($num, $s, 4);
$num = Math::GMPz::Rrotate_right_ul($num, $s, 6);
$num = Math::GMPz::Rrotate_right_ul($num, $s, 7);

if($num eq $c) {push @ok, 1}
else {push @ok, 0}

$ok = 1;
for(@ok) {
    if(!$_) {$ok = 0}
    }

if($ok) { 
      print "ok 3\n";
   }

else {print "not ok 3\n"}

$num = '11100101001101010001' x 20;

Rmpz_set_str($p, $num, 2);
@ok = ();

Math::GMPz::Rrotate_left_gmp($z, $p, 400, 123);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_right_gmp($z, $p, 400, 123);

if($num eq Rmpz_get_str($z, 2)) {push @ok, 1}
else {push @ok, 0}

Rmpz_set_str($p, $num, 2);

Math::GMPz::Rrotate_right_gmp($z, $p, 400, 122);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_left_gmp($z, $p, 400, 122);

if($num eq Rmpz_get_str($z, 2)) {push @ok, 1}
else {push @ok, 0}

Rmpz_set_str($p, $num, 2);

Math::GMPz::Rrotate_left_gmp($z, $p, 400, 98);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_left_gmp($z, $p, 400, 99);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_left_gmp($z, $p, 400, 101);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_left_gmp($z, $p, 400, 102);

if($num eq Rmpz_get_str($z, 2)) {push @ok, 1}
else {push @ok, 0}

Rmpz_set_str($p, $num, 2);

Math::GMPz::Rrotate_right_gmp($z, $p, 400, 98);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_right_gmp($z, $p, 400, 99);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_right_gmp($z, $p, 400, 101);
Rmpz_set($p, $z);
Math::GMPz::Rrotate_right_gmp($z, $p, 400, 102);

if($num eq Rmpz_get_str($z, 2)) {push @ok, 1}
else {push @ok, 0}

$ok = 1;
for(@ok) {
    if(!$_) {$ok = 0}
    }

if($ok) {
      print "ok 4\n";
   }

else {print "not ok 4\n"}

Rmpz_set_str($p, '2273054578125390148547510749474465184313295862948729259706222185512333', 10);
Rmpz_set_str($q, '4377991629350009739166198457292340458620277739746452758878770738196391', 10);

$d = Rmpz_init2(200);
$e = Rmpz_init2(10);
$n = Rmpz_init2(200);

Rmpz_set_str($e, 2, 8);

Math::GMPz::Rrsa_cert($n, $d, $e, $p, $q);

if(Rmpz_get_str($n, 10) eq '9951413916088675822700269649378741805748498918964532256953692911803753609995081556398455195108746384541024445526150032062024459746706590203'
   &&
   Rmpz_get_str($e, 10) eq '7'
   &&
   Rmpz_get_str($d, 10) eq '7108152797206197016214478320984815575534642084974665897824066365574104970677767200713262486713956869810986794251819526342861339109844915343')
     {print "ok 5\n"}
else {print "not ok 5\n"}

