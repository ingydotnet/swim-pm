#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== Strong Phrase
--- swim
I *like* pie.
--- byte
+para
 I 
+bold
 like
-bold
  pie.
-para
--- html
<p>I <strong>like</strong> pie.</p>
--- markdown
I **like** pie.
--- pod
I B<like> pie.

=== Emphasis Phrase
--- swim
I /like/ pie.
--- byte
+para
 I 
+emph
 like
-emph
  pie.
-para
--- html
<p>I <em>like</em> pie.</p>
--- markdown
I _like_ pie.
--- pod
I I<like> pie.

=== Delete Phrase
--- swim
I --don't-- like pie.
--- byte
+para
 I 
+del
 don't
-del
  like pie.
-para
--- html
<p>I <del>don&#39;t</del> like pie.</p>
--- markdown
I <del>don't</del> like pie.
--- pod
I --don't-- like pie.

=== Strong+Emhpasis+Code Phrase
--- swim
I like */`pi`/*.
--- byte
+para
 I like 
+bold
+emph
+code
 pi
-code
-emph
-bold
 .
-para
--- html
<p>I like <strong><em><code>pi</code></em></strong>.</p>
--- markdown
I like **_`pi`_**.
--- pod
I like B<<< I<< C<pi> >> >>>.

=== Delete Markup
--- swim
Do --not-- touch.
--- byte
+para
 Do 
+del
 not
-del
  touch.
-para
--- html
<p>Do <del>not</del> touch.</p>

=== Delete Markup-hyphenated
--- swim
Her --well-known-- infamous father-in-law.
--- byte
+para
 Her 
+del
 well-known
-del
  infamous father-in-law.
-para
--- html
<p>Her <del>well-known</del> infamous father-in-law.</p>

=== Delete Markup - prefixes
--- swim
I tried left-, right- and middle-clicking.
--- byte
+para
 I tried left-, right- and middle-clicking.
-para
--- html
<p>I tried left-, right- and middle-clicking.</p>

=== Single char delete
--- swim
--x--
--- html
<p><del>x</del></p>

=== Underline Markup
--- swim
I _LOVE_ NY!
--- byte
+para
 I 
+under
 LOVE
-under
  NY!
-para
--- html
<p>I <u>LOVE</u> NY!</p>
--- pod
I _LOVE_ NY!

=== Single char bold
--- swim
He was *a* man
--- html
<p>He was <strong>a</strong> man</p>
