---
title: Blash : Examples
date: 2016-11-06T09:37:47Z
update: 
tags: blash
layout: post
draft: false
hidden: false
nomarkdown: false
sumprint: 
summary: `Blash` is able to deliver complete and cmplex sites. But (there is always a *but*), it has a cost : the learning curve to know the product. Here are some examples on the `Blash` usage.
---

<a id="help"></a>First of all, you have to know how to call `help` (even if `Blash`is under DSSL) :

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


* * *

Let's contnue with the configurtion we setted up :

<a id="setup"></a>To check your configuration options, use the `-I` flag :

    $ ./blash -I | head
    Working directory       : ./
    Configuration file      : ./blash.conf
    
    Post directory          : ./post
    Public directory        : ./public
    Theme layout directory  : themes/furry/layout
    Theme public directory  : themes/furry/public
    
    Output directory        : ./out
    Draft directory         : ./draft
    .....


By default, the `blash.conf` (in the current directory) will be used. Use `-f` to load another config file. In this example, we are checking the configuration for the config file `config-examples/theme_timeline.conf` :

    $ ./blash -I -f config-examples/theme_timeline.conf | head
    Working directory       : ./
    Configuration file      : config-examples/theme_timeline.conf
    
    Post directory          : ./post
    Public directory        : ./public
    Theme layout directory  : themes/timeline/layout
    Theme public directory  : themes/timeline/public
    
    Output directory        : ./out
    Draft directory         : ./draft
    .....

* * *

<a id="generate"></a>We are now rendering the site by using the `config-examples/theme_timeline.conf` config file.

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

As you could see above, `Blash` informs you about which posts are generated and for which state : *Draft*, *hidden* or *published*.

* * *

<a id="search"></a>`Blash` allows you to search into your posts for a term (you could have used a `grep` instead) :

    $ ./blash -g flexbox
    id  title                          status              tag(s)
    6   2016-11-06-blash-examples      [Published]  [blash]
    10  2016-01-19-css3-flexbox-model  [Published]  [internet,blash]

In the previous example, 2 posts are found. The search is case insensitive by default.  
But you could force the search to be case sensitive by preceding your *term* wyth a `:`, as in the following example :

    $ ./blash -g :Flexbox
    id  title                          status              tag(s)
    10  2016-01-19-css3-flexbox-model  [Published]  [internet,blash]

* * *

<a id="reduce"></a>In the [generate][#generate] example, you saw that `Blash` produce all possible files. `Blash` is not yet able to produce only one post (in a near future, I hope), but you are allowed to reduce the number of files generated :

    $ ./blash -b -t -x -X -z -Z
    
     * Loading Posts headers...
    
     * Draft Posts : No post or not allowed to work on...
    
     * Hidden Posts : No post or not allowed to work on...
    
     * Regular Posts : Rendering...
    id      - Title [status]        [Tags]
    0 2016-11-19-blash-presentation [Published] [blash]
    1 2016-11-18-markdown-presentation [Published] [markdown]
    3 2016-11-16-markdown-basics [Published] [markdown]
    4 2016-11-14-blash-usages-and-configuration [Published] [blash]
    5 2016-11-09-markdown-syntax [Published] [markdown]
    6 2016-11-06-blash-examples [Published] [blash]
    8 2016-10-11-lorem-ipsum [Published] [mylife,blash]
    9 2016-09-03-error-consequuntur [Published] [mylife]
    10 2016-01-19-css3-flexbox-model [Published] [internet,blash]
    11 2015-11-20-blash-licenses [Published] [blash,license]
    12 2014-11-19-blash-presentation-copy [Published] [blash]
    
     * Index : Rendering...
    
    Blashed !

* * *

<a id="path"></a>If you have to manage multiple site, there is no need to install `Blash` for each site, the `-w` is there :

    $ ../syncDev/blash/blash -w blash -I
    Working dir changed to /home/test/sync/blash/
    Working directory       : /home/test/sync/blash/
    Configuration file      : /home/test/sync/blash/blash.conf
    
    Post directory          : /home/test/sync/blash/post
    Public directory        : /home/test/sync/blash/public
    Theme layout directory  : themes/furry/layout
    Theme public directory  : themes/furry/public
    
    Output directory        : /home/test/sync/blash/out
    Draft directory         : /home/test/sync/blash/draft
    .....

