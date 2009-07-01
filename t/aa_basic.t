use warnings;
use strict;
use Math::GMPz qw(__GNU_MP_VERSION __GNU_MP_VERSION_MINOR __GNU_MP_VERSION_PATCHLEVEL);

print "1..9\n";

warn "\n# Using Math::GMPz version ", $Math::GMPz::VERSION, "\n";
warn "# Using gmp library version ", Math::GMPz::gmp_v(), "\n";
warn "# CC is ", Math::GMPz::__GMP_CC, "\n" if defined Math::GMPz::__GMP_CC;
warn "# CFLAGS are ", Math::GMPz::__GMP_CFLAGS, "\n" if defined Math::GMPz::__GMP_CFLAGS;

if($Math::GMPz::VERSION eq '0.28') {print "ok 1\n"}
else {print "not ok 1 $Math::GMPz::VERSION\n"}

my @version = split /\./, Math::GMPz::gmp_v();

if(scalar(@version) == 3) {print "ok 2\n"}
else {print "not ok 2\n"}

if (__GNU_MP_VERSION == $version[0]) {print "ok 3\n"}
else {print "not ok 3\n"}

if (__GNU_MP_VERSION_MINOR == $version[1]) {print "ok 4\n"}
else {print "not ok 4\n"}

if (__GNU_MP_VERSION_PATCHLEVEL == $version[2]) {print "ok 5\n"}
else {print "not ok 5\n"}

eval {Math::GMPz::__GMP_CC;};
unless($@) {print "ok 6\n"}
else {
  warn "$@\n";
  print "not ok 6\n"
}

eval {Math::GMPz::__GMP_CFLAGS;};
unless($@) {print "ok 7\n"}
else {
  warn "$@\n";
  print "not ok 7\n"
}

my $version_num = version_num(__GNU_MP_VERSION, __GNU_MP_VERSION_MINOR, __GNU_MP_VERSION_PATCHLEVEL);

print $version_num < 262659 ? !defined(Math::GMPz::__GMP_CC) ? "ok 8\n" : "not ok 8\n"
                            :  defined(Math::GMPz::__GMP_CC) ? "ok 8\n" : "not ok 8\n";

print $version_num < 262659 ? !defined(Math::GMPz::__GMP_CFLAGS) ? "ok 9\n" : "not ok 9\n"
                            :  defined(Math::GMPz::__GMP_CFLAGS) ? "ok 9\n" : "not ok 9\n";

sub version_num {
    return ($_[0] << 16) | ($_[1] << 8) | $_[2];
}
