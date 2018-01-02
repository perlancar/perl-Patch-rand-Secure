package Patch::rand::Secure;

# DATE
# VERSION

use strict 'subs', 'vars';
use warnings;
use Math::Random::Secure;

sub import {
    my $pkg = shift;

    my $caller = caller();
    *{"$caller\::rand"} = \&Math::Random::Secure::rand;
}

sub unimport {
    my $pkg = shift;

    my $caller = caller();
    # XXX find a better way to restore original rand
    *{"$caller\::rand"} = sub {
        CORE::rand(@_);
    };
}

1;
# ABSTRACT: Replace rand() with Math::Random::Secure's version

=head1 SYNOPSIS

 % perl -MPatch::rand::Secure -e'...'


=head1 DESCRIPTION


=head1 SEE ALSO

L<Math::Random::Secure>

L<Random::Any>
