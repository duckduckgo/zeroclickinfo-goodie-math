package DDG::Goodie::Math;
# ABSTRACT: Render mathematical equations with MathJax.

use DDG::Goodie;
use HTML::Entities;

#triggers startend => 'latex', 'tex', 'mathml', 'math', 'equation';
triggers query_nowhitespace => qr/^\$.*\$$/, qr/^\$\$.*\$\$$/,
                               qr/^\\begin{math}.*\\end{math}$/,
                               qr/^\\begin{displaymath}.*\\end{displaymath}$/,
                               qr/^\\\(.*\\\)$/, qr/^\\\[.*\\\]$/;


zci is_cached => 1;
zci answer_type => "math";

attribution github => ['https://github.com/SamWhited', 'SamWhited'];
primary_example_queries '$\sum_{i=0}^{N} x_i$';
description 'Render maths using LaTeX or MathML via MathJax';
name 'math';
code_url 'https://github.com/SamWhited/zeroclickinfo-goodie-math/blob/master/lib/DDG/Goodie/Math.pm';
category 'computing_tools';
topics 'math';


handle query_raw => sub {
    my $html = '<script type="text/javascript"
                src="https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
                </script><script type="text/javascript">
                MathJax.Hub.Config({
                  tex2jax: {
                    skipTags: ["script","noscript","style","textarea","pre","code","body","head"],
                    processClass: "math"
                  }
                });
                </script><span class="math">'.$_.'</span>';
    return '', html => $html;
};

1;
