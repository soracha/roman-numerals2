#!/usr/bin/perl

package Roman;

sub new{
	my $class = shift;
	my $self = {};

	bless $self,$class;
	return $self;
}

sub  convert {
	my ($self,$number) = @_;
	my $result = "";

	return $result;
}