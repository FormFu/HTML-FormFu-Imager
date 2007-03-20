package HTML::FormFu::Inflator::Imager;

use strict;
use warnings;
use base 'HTML::FormFu::Inflator';

use Imager;
use Scalar::Util qw/ blessed /;
use Carp qw/ croak /;

sub inflator {
    my ( $self, $value ) = @_;

    return unless defined $value && $value ne "";

    croak "not a file"
        unless blessed($value) && $value->isa('HTML::FormFu::Upload');

    my $img = Imager->new;
    
    $img->read( fh => $value->fh )
        or croak $img->errstr;
    
    return $img;
}

1;

__END__

=head1 NAME

HTML::FormFu::Inflator::Imager - Imager HTML::FormFu inflator

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 AUTHOR

Carl Franks, C<cfranks@cpan.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
