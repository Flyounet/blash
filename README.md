# Blash is a blog engine (mostly) written in bash.

Blash is not only a simple Blog generator, but also a powerfull tool to create complex sites with its template engine.  
As the generated site is purely static, you could publish it where ever you want.

Some examples of sites generated by Blash :

- [Timeline mode](https://flyounet.net/projets/blash-template-timeline/) (same content, but [default template](https://flyounet.net/projets/blash-template-default/))
- [Published on Dropbox](https://dl.dropboxusercontent.com/u/10527821/blash/index.html)

## License

This software is a fork on the modification I did on baker made by taylorchu. The original version has been released under GPLv2. So, Blash is also under GPLv2.
But, all subsequent modifications, I did, have been publish under the dual license DSSL & WTFPL.
All the future modifications will be released under the dual license DSSL & WTPFL and the original work in GPLv2.

## Features

Blash is full of features, more or less 

- [x] Templates (design your templates, Blash will fill it with datas), see Template section
- [x] Markdown<sup>Perl is needed for this feature</sup> (all your Mardkown texts are transformed to HTML),
- [x] Draft/Hidden, see section
- [x] Tags (call it Tags or categories or whatever you like)
- [x] RSS feed (Feed valid [FeedValidator](http://feedvalidator.org/))
- [x] Atom feed (Feed valid [FeedValidator](http://feedvalidator.org/))
- [x] Easy Configuration file (easy, if you read the doc)

## Usages

Blash is CLI software. This means Command Line Interface. Here are some commands available (execute `blash -h` to have all commands) :

- `./blash -h` : Give you the help. It's your best friend for running Blash.
- `./blash -I` : Give you the configuration settings.
- `./blash -p "title"` : Create a post with the `title` and open your default `$EDITOR` (or `vi`).
- `./blash -l` : List all your posts with their states.
- `./blash -b` : Generate all your posts with love. Also include the content of the `PUBLIC_DIR` to your `OUTPUT_DIR`.
- `./blash -e id` : Edit your post _id_ (using your `$EDITOR` (or `vi`)).

## Enhance your site

### Templates

Templates or Layout is a system where you build your pages, include other pages, make statements, and Blash takes it all and build your site.

All template files **MUST** have the **`.md`** extension.

#### Templates : structure example 

You could for example have a template for the `index` pages, one for the page containing text only, and another for your photo posts.  
All of these pages include a header file. You could have something like this :

```
+ templates (dir) :
|
+- index.md
|  @include header.md
|
+- posts.md
|  @include header.md
|
+- photos.md
|  @include header.md
|  @include js-photo.md
|  @include css-photo.md
|
+- header.md
|  @include css-global.md
|
+- css-global.md
|
+- js-photo.md
|
+- css-photo.md

```

#### Templates : File structure

A Template file is composed of two parts :

- Header (enclosed by two dashed line `---`). Header may contain variables. Headers are similar to headers in posts.
- Content

Here is an example :

```
---
colorcss: blue
testing: true
---
@include global-css
@if !testing
	@include {{ colorcss }}
@end

A so **beautiful** test.
```

#### Templates : Variables

Variable identifier should only use `[A-Za-z_]`. Notice that any number is not allowed in a variable name.

```
{{ var }}

{{ content }} # embed child layout output
```

#### Templates : Directives

As you could see, Blash is able to understand directives. Those directives start with a `@` and MUST be the first element on a line.  
Directives are :

- `@include file` : Include part (only content) of a template file. You don't need to add the `.md`, it's added automatically. See example above.
- `@if variable ... @end` : If the variable exists then the content of `@if ... @end` is added to the template. See example above.
- `@if !variable ... @end` : If the variable doesn't exist (or is empty) then the content of `@if ... @end` is added to the template. Space is **not** allowed between `!` and the _variable_.
- `@each variable ... @end` : _variable_ MUST be an array. Iterate on the content of the array. See example below. The first array key MUST be numbered from _`0`_.
- `@cmd ... @end` : Execute the shell code, and embbed the `stdout`. Be aware that this could have impact on your workstation/server. See example below.

#### Templates : Directives examples

**Example for the `@each variable ... @end`** :

```
myVar = [
	{
		"title": "first",
		"content": "example1",
	},
	{
		"title": "second",
		"content": "example2",
	},
]
```

is (internally) encoded as:

```
myVar_0_title=first
myVar_0_content=example1

myVar_1_title=second
myVar_1_content=example2
```

and using the following template: 

```
@each myVar
	{{ idx }} : {{ title }} - {{ content }}
@end
```

becomes:
```
	0 : first - example1
	1 : second - example2
```
Please note the `idx` variable is used internally by Blash.

**Example for the `@cmd ... @end`** :

```
@cmd
  for i in {1..10}; do
    echo "$i"
  done
@end
```

#### Templates : Default variables

Currently, Blash is aware of 3 (three) types of pages :

* The *main Index page*, formally known as `index.html`,
* The *tags Indexes page*, formally known as `index_tags.html`,
* The *article page*.
  
Here is a list of default variables sets by Blash :

 * `SITE_NAME` : String with the *Site Name*. Available on page : `index`, `tags index`, `article`..
 * `SITE_DESC` : String with the *Site Description*.. Available on page : `index`, `tags index`, `article`.
 * `GENERATE_INDEX` : Bool set to true when the *main Index page* is generated (set to false for *tags Indexex page*). Available on page : `index`.
 * `tags_for_index` : Array containing `name` and `link` to all tags. Available on page : `index`, `tags index`, `article`.
 * `NEWDATE` : Bool set to true when a `NEWSECTION` starts. Available on page : `index`, `tags index`.
 * `newdate` : String containing the new section date. Available on page : `index`, `tags index`.
 * `NEWSECTION` : Bool set to true when a `NEWSECTION` starts. Available on page : `index`, `tags index`.
 * `NEWENDSECTION` : Bool set to true when a `NEWENDSECTION` has been reached. Available on page : `index`, `tags index`.
 * `id` : Link to article (without `.html`).
 * `summary` : Article *summary*. Available on page : `index`, `tags index`, `article`.
 * `tags_for_post` : Array containing `name` and `link` to tags related to an article. Available on page : `article`.
 * `TAGS_LINK` : *Deprecated & replaced by `tags_for_post`. Will be removed soon.* String containing list of name/links to tags related to an article. Available on page : `article`.
 * `SUMMARYPRINT` : Bool set to true when the summary has to be printed. Available on page : `article`.
 * `SUMMARYPARSED` : String with *Summary* transformed. Available on page : `article`.
 * `title` : This is the `title` of the *article*. Available on page : `article`.
 * `content` : *Content* of the article. Available on page : `article`.
 * `date` : Article Redaction date. Available on page : `index`, `tags index`, `article`.
 * `update` : Available on page : `index`, `tags index`, `article`.
 * `POST_NEXT` : Link the next (newer) post (or *main index* if none available). Available on page : `article`.
 * `POST_PREV` : Link the previous (older) post (or *main index* if none available). Available on page : `article`.
 * `RSS_DATE` : String exists when RRS feed is generated .Available on page : `index`, `tags index`, `article`.
 * `ATOM_DATE` : String exists when Atom feed is generated. Available on page : `index`, `tags index`, `article`.
 * `INDEX_GENERATION_DATE` : String containing the date of generation. Available on page : `index`, `tags index`.
 * `ARTICLE_GENERATION_DATE` : String containing the date of generation. Available on page : `article`.
    *N.B. *: This variable also exists in the array `posts` named as `generation_date`.


### Posts configuration

The headers in post indicate how Blash has to gerenerate your HTML :

* `title: `: The title of post in the index (and in the post). Also used to generate the filename. 
* `date: `:  The date of the post in the form `2015-11-20T11:06:07Z` (Created by Blash when generating a new post).
* `update: `: The date of the last update in the post (not automatique, same form as `date: `). Could be updated with `blash -u id`.
* `tags: `: The list of tags (comma separated) for the post.
* `layout: `: The name of layout used to generate the post. The name should have not contain the `.md` at the end.
* `draft: `: When generating your post, Blash put your post in the `draft` directory if set to true, in `out` directory either.
* `hidden: `: When generating your post, Blash put your post in the `hidden` directory if set to true, without any reference.
* `summary: `: The summary is printed in the index (and could be added in the post).
* `nomarkdown:` : When set to `true`, the post content is not considered as _Markdown_. So, content stay as is.
* `sumprint: `: If set to true, the summary will be added in the beginning of the post (depends on your layout).

### Blash configuration

Blash is able to load a config file either by itself (if your config file is named `blash.conf`) or by using the `-f filename`.  
Here are some variables you could change (in fact all could be changed, it will depend on your needs) :

* `POST_DIR` : where to store your markdown files
* `OUTPUT_DIR` : Where to store your compiled html files
* `DRAFT_DIR` : Where to store your compiled html draft files
* `LAYOUT_DIR` : Where to store your layout markodown files (templates)
* `PUBLIC_DIR`: Where to store your static content (css, images, js, ...)
* `HIDDEN_DIR`: Where to store your hidden post (default is `OUTPUT_DIR`)

* `SITE_NAME` : The site title
* `SITE_DESC` : The site description
* `DISQUS` : The username of your Disqus account (check the layout)

* `AUTHOR_NAME` : Your name
* `AUTHOR_DESC` : Speak about yourself
* `AUTHOR_EMAIL` : Your email
* `AUTHOR_EMAIL_HASH` : Based on your `AUTHOR_NAME` to make your avatar id
* `AUTHOR_TWITTER`: Your Twitter name account
* `AUTHOR_GITHUB` : Your Github name account

* `TAGS_BASELIST` : When creating a post this Tags list is automatically added
* `TAGS_LINK`: The html (based on your layout) to generate tags list. `==tagNameSlugged==` will be replaced by the tag name slugged. `==tagName==` will be replaced by the tag name.
* `TAGS_LAYOUT` : Use this particular Layout (instead of the default `index.md`) to generate `index_tag.html`.
* `RSS_SITE_URL` : Inform readers where to find your posts when they read the RSS Feed
* `PRINT_ALL_SUMMARY`: Add the summary of your post inside your post. Use `none`, `all` or `user`. `all` and `none` override the `sumprint` header.
* `EDITOR`: Use this editor to edit your post.
* `BLASH_EXTRA_HEADER`: When Blash create a post and adds the header(s) in the post (use `::` as separator).
* `BLASH_TIMELINE_COMPARATOR`: Blash use this variable to compare date of post to set a new `<section>`.
* `BLASH_TIMELINE_RENDERER`: Blash use this variable to render the test of new `<section>`.

* `BLASH_EXPORT_POST_TO_TEXT` : When set to `true` copy the post source. This feature has been added when you want to provide source of your posts.
* `BLASH_EXPORT_POST_TO_TEXT_EXT` : The `.md` extension of the copied is removed and replacce by this one. Don't forget to add a `.` (dot) at the beginning.
* `BLASH_EXPORT_POST_TO_TEXT_OUTPUT_DIR` : Where do you want to copy your source files. (Default value is `OUTPUT_DIR`).
* `BLASH_EXPORT_POST_TO_TEXT_INCLUDE_HEADERS` : If you want headers to be copied in the posts.

* `BLASH_NO_AUTO_UPDATE_ON_EDIT` : If you edit a post blash will automatically update the field `update`, unless set to `true`.

* `BLASH_ON_COPY_IMPLIES_UPDATE` : If you duplicate/copy a post blash will automatically update the field `update`, unless set to `false`.
* `BLASH_ON_COPY_IMPLIES_EDIT` : If you duplicate/copy a post blash will automatically send it to the `EDITOR`, unless set to `false`.
* `BLASH_ON_COPY_IMPLIES_RENAME` : If you duplicate/copy a post blash will automatically rename the post, unless set to `false`.


### Draft & Hidden posts:

* Draft posts : You don't have always time to terminate what you write. So, the default value of the header `draft: ` in each post is set to `true`. This means that when you convert all your posts, those kind of posts are generated in the `DRAFT_DIR`. It's only to avoid your unfinished publication to be readable by everyone. Drafted posts or not included in the indexes.
* Hidden posts : You sometimes want to publish something that is relatively secret, the `hidden: ` header is here for that. The hidden posts are generated in the `OUTPUT_DIR` (by default, and could be override) and not indexed. If you need something more secure, you should select a dedicated directory with at least a per user/password access.

### Markdown

It currently uses the implementation from [Daring Fireball](http://daringfireball.net/projects/markdown/). As a consequence, `perl` is needed for `blash` to work.

![blash](https://github.com/Flyounet/blash/raw/master/themes/legacy-old/public/image/blash.jpg)
