#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== Block Comment
--- swim(<)
    ###

    Comment line 1


      Comment line 2

    ###

    Paragraph

--- byte
+comment
 \nComment line 1\n\n\n  Comment line 2\n\n
-comment
+para
 Paragraph
-para

--- html
<!--

Comment line 1


  Comment line 2


-->

<p>Paragraph</p>

--- markdown
Paragraph

--- pod
=begin comment

Comment line 1


  Comment line 2


=end

Paragraph



=== Line Comment
--- swim(<)
    # This is a comment line.
    # Another. Eat next blank line.

    Paragraph text.

--- byte
+comment
 This is a comment line.
-comment
+comment
 Another. Eat next blank line.
-comment
+para
 Paragraph text.
-para

--- html
<!-- This is a comment line. -->

<!-- Another. Eat next blank line. -->

<p>Paragraph text.</p>

--- markdown
Paragraph text.

--- pod
=for comment This is a comment line.

=for comment Another. Eat next blank line.

Paragraph text.

