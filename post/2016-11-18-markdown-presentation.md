---
title: Markdown : Presentation
date: 2016-11-18T21:31:10Z
update: 2016-11-23T21:36:53Z
tags: markdown
layout: post
draft: false
hidden: false
nomarkdown: false
sumprint: 
summary: 
---

> This is a *partial* copy of the [Markdown](http://daringfireball.net/projects/markdown "Markdown") page from John Gruber site.

Download
--------

[Markdown 1.0.1][dl] (18 KB) -- 17 Dec 2004

[dl]: http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip


Introduction
------------

Markdown is a text-to-HTML conversion tool for web writers. Markdown
allows you to write using an easy-to-read, easy-to-write plain text
format, then convert it to structurally valid XHTML (or HTML).

Thus, "Markdown" is two things: (1) a plain text formatting syntax;
and (2) a software tool, written in Perl, that converts the plain text
formatting to HTML. See the [Syntax][] page for details pertaining to
Markdown's formatting syntax. You can try it out, right now, using the
online [Dingus][].

  [syntax]: 2016-11-09-markdown-syntax.html
  [dingus]: http://daringfireball.net/projects/markdown/dingus

The overriding design goal for Markdown's formatting syntax is to make
it as readable as possible. The idea is that a Markdown-formatted
document should be publishable as-is, as plain text, without looking
like it's been marked up with tags or formatting instructions. While
Markdown's syntax has been influenced by several existing text-to-HTML
filters, the single biggest source of inspiration for Markdown's
syntax is the format of plain text email.

The best way to get a feel for Markdown's formatting syntax is simply
to look at a Markdown-formatted document. For example, you can view
the Markdown source for the article text on this page here:
<http://daringfireball.net/projects/markdown/index.text>

(You can use this '.text' suffix trick to view the Markdown source for
the content of each of the pages in this section, e.g. the
[Syntax][s_src] and [License][l_src] pages.)

  [s_src]: 2016-11-09-markdown-syntax.text
  [l_src]: 2016-11-17-markdown-license.text

Markdown is free software, available under a BSD-style open source
license. See the [License] [pl] page for more information.

  [pl]: 2016-11-17-markdown-license.html


Discussion List <a id="discussion-list"></a>
---------------

*John Grubber speaks :*

I've set up a public [mailing list for discussion about Markdown] [ml].
Any topic related to Markdown -- both its formatting syntax and
its software -- is fair game for discussion. Anyone who is interested
is welcome to join.

It's my hope that the mailing list will lead to good ideas for future
improvements to Markdown.

  [ml]: http://six.pairlist.net/mailman/listinfo/markdown-discuss


Installation and Requirements <a id="install"></a>
-----------------------------

Markdown requires Perl 5.6.0 or later. Welcome to the 21st Century.
Markdown also requires the standard Perl library module [Digest::MD5]
[md5], which is probably already installed on your server.

  [md5]: http://search.cpan.org/dist/Digest-MD5/MD5.pm

