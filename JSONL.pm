package Local::JSONL;

use JSON;
use strict;
use warnings;
our $VERSION = '1.00';

use Exporter 'import';

our @EXPORT_OK = qw(encode_jsonl decode_jsonl);

sub encode_jsonl{
	
	my ($perlscalar) = @_;
	
	my $jsontext = encode_json $perlscalar;
	
	$jsontext =~ s/}\,/}\n/g;
	
	$jsontext =~ s/\[\{/\{/;
	
	$jsontext =~ s/}\]/}/;
	
	return $jsontext;

}

sub decode_jsonl{

	my ($jsontext) = @_;
	
	$jsontext =~ s/ \+ //g;
	
	$jsontext =~ s/'//g;
	
	$jsontext =~ s/}"\n"{/}\n{/g;
	
	my @array = split("\n", $jsontext);
	
	my @result = ();
	
	for my $arg(@array){			
		
		push @result, decode_json $arg;
		
	}	
	
	return \@result;

}
