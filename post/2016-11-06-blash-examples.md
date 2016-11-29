---
title: Blash : Examples
date: 2016-11-06T09:37:47Z
update: 
tags: blash
layout: post
draft: true
hidden: false
nomarkdown: false
sumprint: 
summary: 
---

    $ ./blash -h
    blash [-p <title>|-b [-A][-t][-x][-X][-z][-Z]|-l|-s <title|id>|-c <title|id> [-C]|-d <title|id> [-D]|-e <title|id> [-U]|-r <title|id>|-u <title|id>] [-f <filename>] [-w <path>] [-I] [-h] [-v]
      -A            force all post to be shiped instead of updated [not implemented yet]
      -b            ship all posts
      -c [title|id] copy a post
      -C            When copying if a post exists, it'll be overwritten
      -d [title|id] change the date of a post
      -D            don't change the filename when changing date
      -e [title|id] edit your post ($EDITOR used to call your editor)
      -f [file]     get the configuration from a file
      -g [term]     search for post (default is case insensitive. Start your search with : to become sensitive)
      -h            print help (you currently read it)
    .....



To check your configuration options, use the `-I` flag :

    $ ./blash -I | head
    Working directory       : ./
    Configuration file      : ./blash.conf
    
    Post directory          : ./post
    Public directory        : ./public
    Theme layout directory  : themes/furry/layout
    Theme public directory  : themes/furry/public
    
    Output directory        : ./out
    Draft directory         : ./draft


By default, the `blash.conf` will be used. Use `-f` to load another config file :

    $ ./blash -I -f config-examples/theme_timeline.conf | head
    Working directory       : ./
    Configuration file      : config-examples/theme_timeline.conf
    
    Post directory          : ./post
    Public directory        : ./public
    Theme layout directory  : themes/timeline/layout
    Theme public directory  : themes/timeline/public
    
    Output directory        : ./out
    Draft directory         : ./draft






    $ ./blash -b -f config-examples/theme_timeline.conf 
    
     * Loading Posts headers...
    
     * Draft Posts : Rendering...
    3  2016-11-16-markdown-basics                   [Draft]  [markdown,blash]
    6  2016-10-27-quia-delectuslibero-omnis-a-sunt  [Draft]  [internet,blash]
    
     * Hidden Posts : Rendering...
    2  2016-11-17-markdown-license  [Published]  [markdown,license]  /!\  HIDDEN  /!\  
    
     * Regular Posts : Rendering...
    id      - Title [status]        [Tags]
    0 2016-11-19-blash-presentation [Published] [blash]
    1 2016-11-18-markdown-presentation [Published] [markdown]
    4 2016-11-14-blash-usages-and-configuration [Published] [blash]
    5 2016-11-09-markdown-syntax [Published] [markdown]
    7 2016-10-11-lorem-ipsum [Published] [mylife,blash]
    8 2016-09-03-error-consequuntur [Published] [mylife]
    9 2016-01-19-css3-flexbox-model [Published] [internet,blash]
    10 2015-11-20-blash-licenses [Published] [blash,license]
    11 2014-11-19-blash-presentation-copy [Published] [blash]
    
     * RSS feed : Rendering...
    
     * Atom feed : Rendering...
    
     * Index : Rendering...
    
     * Categories : Rendering...
    
    Blashed !

