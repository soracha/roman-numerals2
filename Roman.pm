#!/usr/bin/perl

package Roman;

sub new{
	my $class = shift;
	my $self  = {};

	bless $self, $class;
	return $self;
}

sub  convert {
	my ($self, $number) = @_;
	my $result          = "";

	if ( $number < 3001 ) {
		while ( $number > 0 ) 
		{
			my @temp = $self->checkNum( $number );
			$result .= $temp[0];
			$number -= $temp[1];
		}
	}

	return $result;
}

sub checkNum {
	my ($self, $input) = @_;
	my $count          = 0;

	if ( $input >= 1000 ) {
		$count = int( $input / 1000 );
		return ( ( "M" x $count ), 1000 * $count );
	}

	elsif ( $input >= 900 ) {	
		return ( "CM", 900 );
	}

	elsif ( $input >= 500 ) {		
		$count = int( ( $input - 500 ) / 100 );
		return ( "D" . ( "C" x $count ), 500 + ( 100 * $count ) );
	}

	elsif ( $input >= 400 ) {
		return ( "CD", 400);
	}

	elsif ( $input >= 100 ) {
		$count = int( $input / 100 );
		return ( ( "C" x $count ), 100 * $count );
	}

	elsif ( $input >= 90 ) {
		return ( "XC", 90 );
	}

	elsif ( $input >= 50 ) {
		$count = int( ( $input - 50) / 10 );
		return ( "L" . ( "X" x $count ), 50 + ( 10 * $count ) );
	}

	elsif ( $input >= 40 ) {
		return ( "XL", 40 );
	}

	elsif ( $input >= 10 ) {
		$count = int( $input / 10 );
		return ( "X" x $count, 10 * $count );
	}

	elsif ( $input >= 9 ) {
		return ( "IX", 9 );
	}

	elsif ( $input >= 5 ) {
		$count = $input - 5;
		return ( "V" . ( "I" x $count ), $input );
	}

	elsif ( $input >= 4 ) {
		return ( "IV", 4 );
	}

	elsif ( $input > 0 ) {
		return ( "I" x $input, $input );
	}
}

1;