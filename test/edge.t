#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== Bold at line start

--- swim
I like pie
*and* coffee.

--- byte
+para
 I like pie\n
+bold
 and
-bold
  coffee.
-para

--- html
<p>I like pie <strong>and</strong> coffee.</p>

--- markdown
I like pie **and** coffee.

--- pod
I like pie B<and> coffee.

=== Angles in pod

--- swim
Well, `2 < 3`

--- html
<p>Well, <code>2 &lt; 3</code></p>

--- pod
Well, C<< 2 < 3 >>
