use warnings;
use strict;
use Math::GMPz qw(:mpz);

print "1..1\n";

print STDERR "\n# Using Math::GMPz version ", $Math::GMPz::VERSION, "\n";
print STDERR "# Using gmp library version ", Math::GMPz::gmp_v(), "\n";

if($Math::GMPz::VERSION eq '0.26') {print "ok 1\n"}
else {print "not ok 1 $Math::GMPz::VERSION\n"}