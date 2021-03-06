---
title: Blash : Presentation
date: 2016-11-19T04:57:17Z
update: 2016-11-21T09:02:05Z
tags: blash
layout: post
draft: false
hidden: false
nomarkdown: false
sumprint: true
summary: Blash is a blog engine (mostly) written in bash.
---

# Blash is a blog engine (mostly) written in bash.

Blash is not only a simple Blog generator, but also a powerfull tool to create complex sites with its template engine.  
As the generated site is purely static, you could publish it where ever you want.

Some examples of sites generated by Blash :

- Template : [Furry][tpl1] (this is the default one)
- Template : [Timeline][tpl2]
- Template : [Legacy (reworked)][tpl3]
- Template : [Legacy (old)][tpl4]

[tpl1]: https://flyounet.net/projets/blash-template-default "A Blash example site with default template"
[tpl2]: https://flyounet.net/projets/blash-template-timeline "A Blash example site with the Timeline template"
[tpl3]: https://flyounet.net/projets/blash-template-legacy "A Blash example site with the Old Baker style template reworked"
[tpl4]: https://flyounet.net/projets/blash-template-legacy-old "A Blash example site with the Old Baker style template"

License <a id="license"></a>
-------

This software is a fork on the modification I did on baker made by taylorchu. The original version has been released under GPL2. So, Blash is also under GPLv2.
But, all subsequent modifications, I did, have been published under the dual license DSSL & WTFPL.
All the future modifications will be released under the dual license DSSL & WTPFL and the original work in GPLv2.

Please consults [Blash][bl] [Licenses][lic].

Features <a id="features"></a>
--------

Blash is full of features, more or less 

- [x] Templates (design your templates, Blash will fill it with datas), see [Template][] section
- [x] Markdown<sup>`Perl` is needed for this feature</sup> (all your [Mardkown][mkd] texts are transformed to `HTML`),
- [x] Draft/Hidden, see [section][draft]
- [x] Tags (call it Tags or Categories or whatever you like)
- [x] RSS feed (Feed valid [FeedValidator](http://feedvalidator.org/))
- [x] Atom feed (Feed valid [FeedValidator](http://feedvalidator.org/))
- [x] Easy Configuration file (easy, if you read the doc)

 [Template]: 2016-11-14-blash-usages-and-configuration.html#templates
 [draft]: 2016-11-14-blash-usages-and-configuration.html#draft


## Usages

Blash is CLI software. This means Command Line Interface. Here are some commands available (execute `blash -h` to have all commands) :

- `./blash -h` : Give you the help. It's your best friend for running Blash.
- `./blash -I` : Print the configuration settings.
- `./blash -p "title"` : Create a post with the `title` and open your default `$EDITOR` (or `vi`).
- `./blash -l` : List all your posts with their states.
- `./blash -b` : Generate all your posts with love. Also include the content of the `PUBLIC_DIR` to your `OUTPUT_DIR`.
- `./blash -e id` : Edit your post _id_ (using your `$EDITOR` (or `vi`)).

As this site is also built using `blash`, and [sources](2016-11-19-blash-presentation.text "This is the Markdown source of this page")  provided, you could easily test it, or follow some [examples][bex].

## Enhance your site

All informations related to enhancement are located in the following page : [Usages and configuration][usage].


<span style='margin:auto'>![blash](https://github.com/Flyounet/blash/raw/master/themes/default/public/image/blash.jpg)</span>



[bl]: https://github.com/Flyounet/blash/ "Github Repository of Blash"
[lic]: 2016-11-14-blash-licenses.html "All Blash Licenses"
[mkd]: 2016-11-01-markdown.html "Markdown presentation"
[bex]: 2016-11-06-blash-examples.html
[df]: http://daringfireball.net/projects/markdown/ "John Gruber's Markdown implementation"
[usage]: 2016-11-14-blash-usages-and-configuration.html "Beginner help"
