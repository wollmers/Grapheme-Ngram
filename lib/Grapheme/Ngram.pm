package Grapheme::Ngram;

use strict;
use warnings;


our $VERSION = 0.001;

sub new {
  my $class = shift;
  # uncoverable condition false
  bless @_ ? @_ > 1 ? {@_} : {%{$_[0]}} : {}, ref $class || $class;
}

sub ngram {
  my ($self, $word, $width) = @_;

  $word ||= '';

  return $self->from_tokens(
    [$self->_tokenize($word)],
    $width
  );
}

sub from_tokens {
  my ($self, $tokens, $width) = @_;

  $width = 1 unless defined $width;

  my @ngrams;
  return @ngrams 
    unless ($width =~ m/^[1-9][0-9]*$/x && $width <= scalar(@$tokens));

  for my $i (0..scalar(@$tokens)-$width) {
    my $ngram = join('',@$tokens[$i..$i+$width-1]);
    push @ngrams,$ngram;
  }

  return @ngrams;

}

sub _tokenize { ($_[1] =~ m/(\X)/g) }

1;


__END__

=head1 NAME

Grapheme::Ngram - n-grams of Unicode Extended Grapheme Clusters

=head1 SYNOPSIS

 use Grapheme::Ngram;
 
 my $class = 'Grapheme::Ngram';
 my @ngrams = $class->ngram($string,$width);
 

=head1 DESCRIPTION

For many applications it's better to work along graphemes.

Building n-grams is one of them.

=head1 METHODS


=head2 new

  $object = Grapheme::Ngram->new();

=head2 ngram

  my @ngram = $object->ngram($string, $width);
  
C<$string> ... string of characters
  
C<$width> ... length of the resulting tokens. Default is 1.

Returns an empty list if the number of graphemes in C<$string> is lower than C<$width>,
or if C<$width> is not an integer larger than 0.    
  
=head2 from_tokens

  my @ngram = $object->from_tokens(\@tokens, $width);
  
Same as C<ngram> but takes tokens. This method is used by C<ngram>.

This allows to use a custom tokenizer for e.g. treating 'sh' also as grapheme:

  my @tokens = $string =~ m/(Sh|sh|\X)/g;
  
=head2 _tokenize

  my @graphemes = $object->_tokenize($string);
  
This internal method splits C<$string> into a list of graphemes.

=head1 SOURCE REPOSITORY

L<http://github.com/wollmers/Grapheme-Ngram>

=head1 AUTHOR

Helmut Wollmersdorfer, E<lt>helmut.wollmersdorfer@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

