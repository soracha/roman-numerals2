#!/usr/bin/perl

use List::Compare;
use Test::More qw(no_plan);

use_ok('Roman');

my $obj = new Roman();
my @expect = ();


@got = $obj->checkNum(2567);
@expect = ( "MM", 2000 );

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
		)->is_LequivalentR
	,"checkNum 2567 => MM"
);

@got = $obj->checkNum(987);
@expect = ( "CM", 900 );

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
		)->is_LequivalentR
	,"checkNum 987 => CM"
);

@got = $obj->checkNum(795);
@expect = ( "DCC", 700 );

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
		)->is_LequivalentR
	,"checkNum 795 => DCC"
);

@got = $obj->checkNum(595);
@expect = ( "D", 500 );

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
		)->is_LequivalentR
	,"checkNum 595 => D"
);

@got = $obj->checkNum(99);
@expect = ( "XC", 90 );

ok(
	List::Compare->new(
		'-a',
		\@expect,
		\@got
		)->is_LequivalentR
	,"checkNum 99 => XC"
);


is($obj->convert(1),    "I", "convert 1    => I");
is($obj->convert(5),    "V", "convert 5    => V");
is($obj->convert(10),   "X", "convert 10   => X");
is($obj->convert(50),   "L", "convert 50   => L");
is($obj->convert(100),  "C", "convert 100  => C");
is($obj->convert(500),  "D", "convert 500  => D");
is($obj->convert(1000), "M", "convert 1000 => M");

is($obj->convert(2),    "II", "convert 2    => II");
is($obj->convert(20),   "XX", "convert 20   => XX");
is($obj->convert(200),  "CC", "convert 200  => CC");
is($obj->convert(2000), "MM", "convert 2000 => MM");

is($obj->convert(3), "III", "convert 3  => III");
is($obj->convert(6), "VI",  "convert 6  => VI");
is($obj->convert(9), "IX",  "convert 9  => IX");

is($obj->convert(11), "XI",  "convert 11  => XI");
is($obj->convert(14), "XIV", "convert 14  => XIV");
is($obj->convert(15), "XV",  "convert 15  => XV");
is($obj->convert(19), "XIX", "convert 19  => XIX");

is($obj->convert(51), "LI",  "convert 51  => LI");
is($obj->convert(55), "LV",  "convert 55  => LV");
is($obj->convert(56), "LVI", "convert 56  => LIV");
is($obj->convert(59), "LIX", "convert 59  => LIX");

is($obj->convert(91), "XCI",  "convert 91  => XCI");
is($obj->convert(94), "XCIV", "convert 94  => XCIV");
is($obj->convert(95), "XCV",  "convert 95  => XCV");
is($obj->convert(99), "XCIX", "convert 99  => XCIX");

is($obj->convert(111), "CXI",  "convert 111  => CXI");
is($obj->convert(115), "CXV",  "convert 115  => CXV");
is($obj->convert(116), "CXVI", "convert 116  => CXVI");
is($obj->convert(119), "CXIX", "convert 119  => CXIX");

is($obj->convert(251), "CCLI",  "convert 251  => CCLI");
is($obj->convert(254), "CCLIV", "convert 254  => CCLIV");
is($obj->convert(255), "CCLV",  "convert 255  => CCLV");
is($obj->convert(259), "CCLIX", "convert 259  => CCLIX");

is($obj->convert(591), "DXCI",  "convert 591  => DCMI");
is($obj->convert(594), "DXCIV", "convert 594  => DCMIV");
is($obj->convert(595), "DXCV",  "convert 595  => DCMV");
is($obj->convert(599), "DXCIX", "convert 599  => DCMIX");

is($obj->convert(791), "DCCXCI",  "convert 791  => DCCXCI");
is($obj->convert(795), "DCCXCV",  "convert 795  => DCCXCV");
is($obj->convert(796), "DCCXCVI", "convert 996  => CMXCVI");
is($obj->convert(799), "DCCXCIX", "convert 999  => CMXCIX");

is($obj->convert(2591), "MMDXCI",  "convert 2591  => MMDXCI");
is($obj->convert(2595), "MMDXCV",  "convert 2595  => MMDXCV");
is($obj->convert(2596), "MMDXCVI", "convert 2596  => MMDXCVI");
is($obj->convert(2599), "MMDXCIX", "convert 2599  => MMDXCIX");

is($obj->convert(31),   "XXXI",      "convert 31    => XXXI");
is($obj->convert(369),  "CCCLXIX",   "convert 369   => CCCLXIX");
is($obj->convert(369),  "CCCLXIX",   "convert 679   => DCLXXIX");
is($obj->convert(448),  "CDXLVIII",  "convert 448   => CDXLVIII");
is($obj->convert(1999), "MCMXCIX",   "convert 1999  => MCMXCIX");
