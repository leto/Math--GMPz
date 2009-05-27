eval "use Test::Pod 1.00";

if($@) {
  print "1..1\n";
  warn "Skipping test 1 - no recent version of Test::Pod installed\n";
  print "ok 1\n";
}

else {
     Test::Pod::all_pod_files_ok();
}