package HTML::FormFu::Transformer::Imager;

use strict;
use warnings;
use base 'HTML::FormFu::Transformer';

use Scalar::Util qw/ blessed /;
use Carp qw/ croak /;

my @methods = qw/ scale scaleX scaleY crop flip rotate convert map /;

__PACKAGE__->mk_accessors( @methods );

sub transformer {
    my ( $self, $value ) = @_;
    
    return unless defined $value && $value ne "";

    croak "not an Imager object"
        unless blessed($value) && $value->isa('Imager');
    
    for my $method (@methods) {
        my $args = $self->$method;
        next if !defined $args;
        
        my @args;
        
        if ( ref $args eq 'HASH' ) {
            @args = %$args;
        }
        elsif ( ref $args eq 'ARRAY' ) {
            @args = @$args;
        }
        else {
            @args = ($args);
        }
        
        $value = $value->$method(@args);
    }
    
    return $value;
}

1;

__END__

=head1 NAME

HTML::FormFu::Transformer::Imager

=head1 SYNOPSIS

    ---
    elements:
      - type: file
        name: photo
        inflators: 
          - type: Imager
        transformers:
          - type: Imager
            scaleX: [ pixels, 50 ] 

=head1 DESCRIPTION

All methods accept either a scalar, arrayref or hashref of arguments.
Arrayrefs and hashrefs are unrolled and passed to the 
L<Imager::Transformations> method as a list.

=head1 METHODS

=head scale

See C<scale> in Imager::Transformations.

=head scaleX

See C<scaleX> in Imager::Transformations.

=head scaleY

See C<scaleY> in Imager::Transformations.

=head crop

See C<crop> in Imager::Transformations.

=head flip

See C<flip> in Imager::Transformations.

=head rotate

See C<rotate> in Imager::Transformations.

=head convert

See C<convert> in Imager::Transformations.

=head map

See C<map> in Imager::Transformations.

=head1 SEE ALSO

L<HTML::FormFu::Imager>, L<HTML::FormFu>

=head1 AUTHOR

Carl Franks

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
