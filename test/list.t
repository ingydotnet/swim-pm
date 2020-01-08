#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== Lists
--- swim
Paragraph 1
* List item 1
  * Sublist a
* List
  item
  2
* List item 3
* List item 4
    preformatted
Paragraph 2
--- byte
+para
 Paragraph 1
-para
+list
+item
 List item 1
+list
+item
 Sublist a
-item
-list
-item
+item
 List\nitem\n2
-item
+item
 List item 3
-item
+item
 List item 4
+pref
 preformatted
-pref
-item
-list
+para
 Paragraph 2
-para
--- html
<p>Paragraph 1</p>

<ul>
<li>List item 1
<ul>
<li>Sublist a</li>
</ul>

</li>
<li>List item 2</li>
<li>List item 3</li>
<li>List item 4
<pre><code>preformatted
</code></pre>

</li>
</ul>

<p>Paragraph 2</p>
--- markdown
Paragraph 1

* List item 1
  * Sublist a
* List item 2
* List item 3
* List item 4

Paragraph 2
--- pod
Paragraph 1

=over

=item * List item 1

=over

=item * Sublist a

=back

=item * List item 2

=item * List item 3

=item * List item 4

    preformatted

=back

Paragraph 2

=== List with Paragraphs
--- swim
* foo

  Foo is ok

* bar

  Bar is too far
--- pod
=over

=item * foo

Foo is ok

=item * bar

Bar is too far

=back

=== Numbered List
--- swim
+ one

  + one point one
  + one point two

+ two
--- pod
=over

=item 1.

one

=over

=item 1.

one point one

=item 2.

one point two

=back

=item 2.

two

=back

=== Block in block spacing bug
--- swim
+ foo

  bar

  baz
--- pod
=over

=item 1.

foo

bar

baz

=back
