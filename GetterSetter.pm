package Local::GetterSetter;

use strict;
use warnings;
our $VERSION = '1.00';

sub import {
    shift;
    my $current_package = caller;
    for my $variable (@_) {
        no strict 'refs';
        *{$current_package.'::set_'.$variable} = sub { ${"$current_package::$variable"} = shift;};
        *{$current_package.'::get_'.$variable} = sub { return ${"$current_package::$variable"}; };
    }
}

1;
