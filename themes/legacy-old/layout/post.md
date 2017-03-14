---
---
<!DOCTYPE html>
<html>
<head>
@include head
<title>{{ title }} - {{ SITE_NAME }}</title>
</head>

<main class="container">
	<header>
	<nav>
		<ul class="nav nav-pills pull-right">
			<li class="active"><a href="index.html">Home</a></li>
			<li><a href="{{ POST_PREV }}" title="Newer"><i class="fa fa-long-arrow-left fa-2x"></i></a></li>
			<li><a href="{{ POST_NEXT }}" title="Older"><i class="fa fa-long-arrow-right fa-2x"></i></a></li>
			<li><a href="#author">About</a></li>
		</ul>
	</nav>
	<h1>{{ title }}</h1>
	</header>

	<article>
@if PRINTSUMMARY
		{{ SUMMARYPARSED }}
		<hr class="summary" />
@end
		{{ content }}
	</article>

@if tags
	<aside>
		<ul class="tags">
			{{ TAGSLIST }}
		</ul>
	</aside> 
@end

	<footer id="author" class="row">
		<section class="col-md-5">
			<p class="post-date">Published on <time>{{ date }}</time></p>
@if update
			<p class="post-date">Last updated on <time>{{ update }}</time></p>
@end
		</section>
		<section class="col-md-2">
			<img alt="author-avatar" class="author-avatar pull-right" src="http://www.gravatar.com/avatar/{{ AUTHOR_EMAIL_HASH }}" />
		</section>
		<section class="col-md-5">
@include author
		</section>
	</footer>
@include disqus
</main>

</html>
