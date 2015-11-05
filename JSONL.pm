package Local::JSONL;

use JSON;
use strict;
use warnings;
our $VERSION = '1.00';

use Exporter 'import';

our @EXPORT_OK = qw(encode_jsonl decode_jsonl);

sub encode_jsonl{
	
	my ($perlscalar) = @_;
	
	my @array = @{$perlscalar};
	
	my @result = ();

	for my $arg(@array){
	
		push @result, encode_json $arg;
	
	}
	
	my $str = join("\n", @result);
	
	return $str;

}

sub decode_jsonl{

	my ($jsontext) = @_;
	
	my @array = split("\n", $jsontext);
	
	my @result = ();
	
	for my $arg(@array){			
		
		push @result, decode_json $arg;
		
	}	
	
	return \@result;

}
