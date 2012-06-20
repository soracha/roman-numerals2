#!/usr/bin/perl

use Test::More qw(no_plan);

use_ok('Roman');

my $obj = new Roman();

is($obj->convert(1),"I","1=>I");