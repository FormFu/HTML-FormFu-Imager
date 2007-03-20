package HTML::FormFu::Validator::Imager::Size;

use strict;
use warnings;
use base 'HTML::FormFu::Validator';

use Scalar::Util qw/ blessed /;
use Carp qw/ croak /;

__PACKAGE__->mk_accessors(qw/ width height pixels /);

sub validate_value {
    my ( $self, $value ) = @_;
    
    return 1 if !defined $value || $value eq "";

    croak "not an Imager object"
        unless blessed($value) && $value->isa('Imager');
    
    my $width  = $value->getwidth;
    my $height = $value->getheight;
    
    if ( my $max = $self->pixels ) {
        return if $width > $max || $height > $max;
    }
    
    if ( my $max = $self->width ) {
        return if $width > $max;
    }
    
    if ( my $max = $self->height ) {
        return if $height > $max;
    }
    
    return 1;
}

1;

__END__

=head1 NAME

HTML::FormFu::Transformer::Imager::Pixels

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 AUTHOR

Carl Franks, C<cfranks@cpan.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
