package Local::JSONL;

use JSON;
use strict;
use warnings;
our $VERSION = '1.00';

use Exporter 'import';

our @EXPORT_OK = qw(encode_jsonl decode_jsonl);

sub encode_jsonl{
	
	my ($perlscalar) = @_;
	
	@array = split("\n", $perlscalar);
	
	my @result = ();
	
	my $jsontext = 0;
			
	for my $i (0..$#array){

		if($array[$i] eq "[" || $array[$i] eq "]"){
		
			next ;
			
		}
		else{
			
			$jsontext = encode_json $array[$i];		
		
			push @result, $jsontext;
		
		}
		
	}
	
	my $res = join("\n",@result);
	
	return $res;
	
}

sub decode_jsonl{
}
