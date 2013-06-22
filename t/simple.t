#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

use DDG::Test::Goodie;

zci answer_type => 'math';
zci is_cached => 1;

ddg_goodie_test(
	[qw(
		DDG::Goodie::Math
	)],
	'$\sum_{i=0}^{N} x_i$' => test_zci('', html => qr|<span class="math">\$\\sum_{i=0}\^{N} x_i\$</span>|),
	'$$\sum_{i=0}^{N} x_i$$' => test_zci('', html => qr|<span class="math">\$\$\\sum_{i=0}\^{N} x_i\$\$</span>|),
	'\begin{math}\sum_{i=0}^{N} x_i\end{math}' => test_zci('', html => qr|<span class="math">\\begin{math}\\sum_{i=0}\^{N} x_i\\end{math}</span>|),
	'\begin{displaymath}\sum_{i=0}^{N} x_i\end{displaymath}' => test_zci('', html => qr|<span class="math">\\begin{displaymath}\\sum_{i=0}\^{N} x_i\\end{displaymath}</span>|),
	'\(\sum_{i=0}^{N} x_i\)' => test_zci('', html => qr|<span class="math">\\\(\\sum_{i=0}\^{N} x_i\\\)</span>|),
	'\[\sum_{i=0}^{N} x_i\]' => test_zci('', html => qr|<span class="math">\\\[\\sum_{i=0}\^{N} x_i\\\]</span>|),
);

done_testing;
