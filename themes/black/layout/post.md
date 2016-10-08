---
---
<!DOCTYPE html>
<html>
<head>
@include head
<title>{{ title }} - {{ SITE_NAME }}</title>
</head>
<body>
<main class="container">
	<header>
	<nav>
		<ul class="nav nav-pills pull-right">
			<li class="active"><a href="index.html" title="Home"><i class="fa fa-home fa-2x"></i></a></li>
			<li><a href="{{ POST_PREV }}" title="Newer"><i class="fa fa-long-arrow-left fa-2x"></i></a></li>
			<li><a href="{{ POST_NEXT }}" title="Older"><i class="fa fa-long-arrow-right fa-2x"></i></a></li>
			<li><a href="#author"i title="About"><i class="fa fa-heartbeat fa-2x"></i></a></li>
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
	<ul class="cats">
		{{ TAGSLIST }}
	</ul>
	</aside>
@end
	<footer id="author" class="row">
		<section class="col-md-5">
			<p class="post-date">Published on <time>{{ date }}</time></p>
		</section>
		<section class="col-md-2">
@include contact
		</section>
		<section class="col-md-5">
@include author
		</section>
	</footer>
</main>
</body>
</html>
