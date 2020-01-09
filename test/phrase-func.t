#!/usr/bin/env testml

*swim.parse('HTML') == *html
  :"Swim to HTML - +"

*swim.parse('Pod') == *pod
  :"Swim to Pod - +"


# TODO Add other markup tests.

=== Not really a phase func
--- swim
Ingy dot Net <ingy@ingy.net>
--- pod
Ingy dot Net <ingy@ingy.net>

=== Phrase function: simple
--- swim
<bold content>
--- html
<p><strong>content</strong></p>

=== Phrase function: simple with single attribute
--- swim
<bold important:content>
--- html
<p><strong class="important">content</strong></p>

=== Phrase function: simple with multiple attributes
--- swim
<bold quite important:content>
--- html
<p><strong class="quite important">content</strong></p>

=== Phrase function: key-value attribute
--- swim
<bold id=item32:content>
--- html
<p><strong id="item32">content</strong></p>

=== Phrase function: key-quoted-value attribute
--- swim
<bold id="item32":content>
--- html
<p><strong id="item32">content</strong></p>

=== Phrase function: key-value attribute; escaped colon
--- swim
<bold id=item3\:2:content>
--- html
<p><strong id="item3:2">content</strong></p>

=== Phrase function: key-quoted-value attribute; with space
--- swim
<bold title="A foo bar":content>
--- html
<p><strong title="A foo bar">content</strong></p>

=== Phrase function: attribute plus leading space
--- swim
<bold quite important: content>
--- html
<p><strong class="quite important"> content</strong></p>

=== Phrase function: attribute plus trailing space
--- swim
<bold quite important:content >
--- html
<p><strong class="quite important">content </strong></p>

=== Phrase function: leading colon
--- swim
<bold ::leading>
--- html
<p><strong>:leading</strong></p>

=== Phrase function: lots of colons in content
--- swim
<bold ::colons:everywhere:>
--- html
<p><strong>:colons:everywhere:</strong></p>

=== Phrase function: lots of colons in content; no leading space
--- swim
<bold::colons:everywhere:>
--- html
<p><strong>:colons:everywhere:</strong></p>

=== Phrase function: attributes and colons in content
--- swim
<bold important::colons:everywhere:>
--- html
<p><strong class="important">:colons:everywhere:</strong></p>

=== Phrase function: no content
--- swim
<bold>
--- html
<p><strong/></p>

=== Phrase function: no content: one space
--- swim
<bold >
--- html
<p><strong/></p>

=== Phrase function: no content: two spaces
--- SKIP
--- swim
<bold  >
--- html
<p><strong> </strong></p>

=== Phrase function: attributes but no content
--- swim
<bold important:>
--- html
<p><strong class="important"/></p>

=== Phrase function: attribute but no content, no trailing colon
--- swim
<bold important:>
--- html
<p><strong class="important"/></p>

=== Phrase function: attributes but no content, no trailing colon, spaces in attributes
--- SKIP
--- swim
<bold quite important:>
<bold: quite important >
--- html
<p><strong class="quite important"/></p>

=== Phrase function: span (no name)
--- SKIP
--- swim
<:important:content>
--- html
<p><span class="important">content</span></p>

=== Phrase function: empty span
--- SKIP
--- swim
<:>
--- html
<p><span/></p>

=== Phrase function: empty span with attribute
--- SKIP
--- swim
<:important:>
--- html
<p><span class="important"/></p>

=== Phrase function: span with no attribute
--- SKIP
--- swim
<:content>
--- html
<p><span>content</span></p>

=== Phrase function: nested
--- SKIP
--- swim
<bold <emph bold italic>>
--- html
<p><strong><em>bold italic</em></strong></p>

=== Phrase function: nested with class
--- SKIP
--- swim
<bold <emph variable: bold italic>>
--- html
<p><strong><em class="variable">bold italic</em></strong></p>

=== Phrase function: nested with angles in attributes
--- SKIP
--- swim
<bold data-info="<oops>":<emph bold italic>>
--- html
<p><strong data-info="&lt;oops&gt;"><em>bold italic</em></strong></p>


