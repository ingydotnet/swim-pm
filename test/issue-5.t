use Test::More tests => 1;

is `$^X -e "print q{foo}" | $^X ./bin/swim`, "<p>foo</p>\n",
    "Trailing newline not needed";
