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
        
        my @args = ($args);
        
        if ( ref $args eq 'HASH' ) {
            @args = %$args;
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

=head1 DESCRIPTION

=head1 AUTHOR

Carl Franks, C<cfranks@cpan.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
