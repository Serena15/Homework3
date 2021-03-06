package Local::Currency; 
use strict;
use warnings;
use DDP;
use Exporter 'import';
our $VERSION = '1.00';
our @EXPORT = qw(set_rate);

our %hash;

sub set_rate {	
	my ($hash_ref) = @_;			
	%hash = %{$hash_ref};	
}		

sub AUTOLOAD {
	my ($start_summ) = @_;
	our $AUTOLOAD;
	my @array = split(/::/,$AUTOLOAD);
	my $my_currency = $array[-1];
	my $cur2;
	($my_currency, $cur2) = split(/_to_/, $my_currency);
	my $cours_cur1 = $hash{$my_currency};
	my $cours_cur2 = $hash{$cur2};
	my $result_summ = $cours_cur1/$cours_cur2 * $start_summ;
	return $result_summ;
}

1;
