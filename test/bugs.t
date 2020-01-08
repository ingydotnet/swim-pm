#!/usr/bin/env testml

*swim.parse('Byte') == *byte
  :"Swim to ByteCode - +"

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Markdown') == *markdown
  :"Swim to Markdown - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


=== List with code
--- swim
* Foo `bar`

--- byte
+list
+item
 Foo 
+code
 bar
-code
-item
-list

# --- markdown
# * Foo `bar`

--- pod
=over

=item * Foo C<bar>

=back

=== '::' in data paragraph

--- swim
- Dump
  Data::Dumper is OK
--- byte
+data
 Dump
+para
 Data::Dumper is OK
-para
-data

--- pod
=over

=item Dump

Data::Dumper is OK

=back
