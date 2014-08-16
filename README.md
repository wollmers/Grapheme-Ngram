# NAME

Grapheme::Ngram - n-grams of Unicode Extended Grapheme Clusters

<div>

</div>

<a href="https://travis-ci.org/wollmers/Grapheme-Ngram"><img src="https://travis-ci.org/wollmers/Grapheme-Ngram.png" alt="Grapheme-Ngram"></a>
<a href='https://coveralls.io/r/wollmers/Grapheme-Ngram?branch=master'><img src='https://coveralls.io/repos/wollmers/Grapheme-Ngram/badge.png?branch=master' alt='Coverage Status' /></a>

# SYNOPSIS

    use Grapheme::Ngram;
    
    my $class = 'Grapheme::Ngram';
    my @ngrams = $class->ngram($string,$width);
    

# DESCRIPTION

For many applications it's better to work along graphemes.

Building n-grams is one of them.

# METHODS

## new

    $object = Grapheme::Ngram->new();

## ngram

    my @ngram = $object->ngram($string, $width);
    

`$string` ... string of characters

`$width` ... length of the resulting tokens. Default is 1.

Returns an empty list if the number of graphemes in `$string` is lower than `$width`,
or if `$width` is not an integer larger than 0.    

## from\_tokens

    my @ngram = $object->from_tokens(\@tokens, $width);
    

Same as `ngram` but takes tokens. This method is used by `ngram`.

This allows to use a custom tokenizer for e.g. treating 'sh' also as grapheme:

    my @tokens = $string =~ m/(Sh|sh|\X)/g;
    

## \_tokenize

    my @graphemes = $object->_tokenize($string);
    

This internal method splits `$string` into a list of graphemes.

# SOURCE REPOSITORY

[http://github.com/wollmers/Grapheme-Ngram](http://github.com/wollmers/Grapheme-Ngram)

# AUTHOR

Helmut Wollmersdorfer, <helmut.wollmersdorfer@gmail.com>

# COPYRIGHT AND LICENSE

Copyright (C) 2014 by Helmut Wollmersdorfer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
