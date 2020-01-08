#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== Data List
--- swim
- term one :: Definition 1 is /just/ a line
- `term 2` :: Definition 2
  Followed by a paragraph

- Term
  No definition,
  just a paragraph
- Final
  * No definition
  * Just
  * a list

--- pod
=over

=item term one

Definition 1 is I<just> a line

=item C<term 2>

Definition 2

Followed by a paragraph

=item Term

No definition, just a paragraph

=item Final

=over

=item * No definition

=item * Just

=item * a list

=back

=back
--- html
<dl>
<dt>term one</dt>
<dd>Definition 1 is <em>just</em> a line
<dd>
<dt><code>term 2</code></dt>
<dd>Definition 2
<p>Followed by a paragraph</p>

<dd>
<dt>Term</dt>
<dd><p>No definition, just a paragraph</p>

<dd>
<dt>Final</dt>
<dd><ul>
<li>No definition</li>
<li>Just</li>
<li>a list</li>
</ul>

<dd>
</dl>

=== Multi-level item
--- swim
- this
    $a = $b
  See?
--- pod
=over

=item this

    $a = $b

See?

=back
--- html
<dl>
<dt>this</dt>
<dd><pre><code>$a = $b
</code></pre>
<p>See?</p>

<dd>
</dl>
