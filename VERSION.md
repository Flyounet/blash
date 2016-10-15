
## 1.2.1 - 2016/10/15 (Flyounet)

 * README update
 + Blash is now able to copy source posts for you to provide them.
 * EDITOR variable is now configurable.
 * All Themes are now mutualised under a directory `themes`
 * Blash is able to search into posts
 * Blash now auto-update the 'update' field in a post using edit (-e), if the post is changed

## 1.2.0 - 2016/05/10 (Flyounet) <This was my last update to Baker, and the first Blash version>.

 * README big update
 + Indexes generated for tags could have their own template
 + Baker is able to generate a sort of timeline (depending on templates). Generate a section depending on the date of prev/next post.
 + The `-u` flag now update the field `update:`
 + A subdirectory with a bigger example than the origanl one has been created
 + A VERSION file has been created

-----

Those previous modifications have been done when I worked on Baker.

## 1.1.4a - 2016/04/19 (Flyounet)

 * Removing unwanted default extra headers.

## 1.1.4 - 2016/04/19 (Flyounet)

 + Adding the global variable to have extra headers.

## 1.1.3a - 2016/03/25 (Flyounet)

 * Correcting an issue in the version info. A `$` is missing. When exporting from github a part of the code is missing.

## 1.1.3 - 2016/03/22 (Flyounet)

 * Changing the list printing
 + Markdown in summary is now parsed

## 1.1.2 - 2016/03/11 (Flyounet)

 + Adding -o to open with `xdg-open` a bakered post

##1.1.1 - 2016/03/08 (Flyounet)

 + Adding LICENSE file
 + Adding hidden feature to write a post without indexing it
 + Adding the edit feature to call your editor for a post through baker
 + Adding the -I to view configuration

## 1.1.0 - 2016/02/25 (Flyounet)

 + Adding a Makefile for install/uninstall
 + External Markdown perl file is now included in the baker script itself. Baker is now a single file.
 + Adding the -v to view the version

## 1.0.2 - 2015/12/21 (Flyounet)

 + Now generate an Atom feed
 + The summary could now be added in each post
 * README update
 + Adding a tool to test baker speed

## 1.0.1 - 2015/12/09 (Flyounet)

 + A default config file is loaded if found
 + Now generate an RSS feed


## 1.0.0 - 2015/12/01 (Flyounet)

 * Rewriting a lot to make functions
 + Drafted post are generated in the `DRAFT_DIR̀`
 + Config could be loaded from a file and override default configuration
 + The slug() handle accent
 + A function to change the date inside the post has been created
 + A function to rename a post depending on the modified headers
 + A function to toggle draft status now exists
 + A function to list posts (with status and tags)
 + For each post a `POST_PREV`/`POST_NEXT` button is generated
 + Each post could now have multiple tags
 + An index per tag is generated
 + Old arguments still exist, but new ones offer more features
 + Adding another layout : `layout_black`/`public_black`

## 1.0.0-pre2 - 2015/11/20 (Tailorchu)

 * Last original work
