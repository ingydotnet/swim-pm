#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== Name/Abstract Title

--- swim(<)
    New::Black
    ==========

    Is Still Black

    = Synopsis

    Back in black, hit the sack.

--- byte
+title
 New::Black
-title
+para
 Is Still Black
-para
+head1
 Synopsis
-head1
+para
 Back in black, hit the sack.
-para

--- markdown(<)
    New::Black
    ==========

    Is Still Black

    # Synopsis

    Back in black, hit the sack.

--- pod
=head1 Name

New::Black - Is Still Black

=head1 Synopsis

Back in black, hit the sack.

--- html
<h1 class="title">New::Black</h1>

<p>Is Still Black</p>

<h1>Synopsis</h1>

<p>Back in black, hit the sack.</p>



=== Title and Paragraph

--- swim(<)
    My Title
    ========

    O HAI
    FREND

--- byte-XXX-FIXME
+title
 My Title
-title
+para
 O HAI\nFREND
-para

--- html
<h1 class="title">My Title</h1>

<p>O HAI FREND</p>

--- markdown(<)
    My Title
    ========

    O HAI FREND

--- pod
=head1 My Title

O HAI FREND



=== Headers

--- swim(<)
    == Level 2 Header ==
    Paragraph text.

    === Level 3 Header
    Multi Line

    Paragraph text

    ==== Level 4 Header
      preformatted text

--- byte
+head2
 Level 2 Header
-head2
+para
 Paragraph text.
-para
+head3
 Level 3 Header\nMulti Line
-head3
+para
 Paragraph text
-para
+head4
 Level 4 Header
-head4
+pref
 preformatted text
-pref

--- html
<h2>Level 2 Header</h2>

<p>Paragraph text.</p>

<h3>Level 3 Header Multi Line</h3>

<p>Paragraph text</p>

<h4>Level 4 Header</h4>

<pre><code>preformatted text
</code></pre>

--- markdown(<)
    ## Level 2 Header

    Paragraph text.

    ### Level 3 Header Multi Line

    Paragraph text

    #### Level 4 Header

        preformatted text

--- pod
=head2 Level 2 Header

Paragraph text.

=head3 Level 3 Header Multi Line

Paragraph text

=head4 Level 4 Header

    preformatted text



=== Markup in Title

--- swim(<)
    `Foo`
    =====

    The *New* Foo

    Start

--- pod
=head1 Name

C<Foo> - The B<New> Foo

Start

=== Markup in Header

--- swim(<)
    = This /and/ That

--- html
<h1>This <em>and</em> That</h1>
