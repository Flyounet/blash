---
---
<!DOCTYPE html>
<html>
<head>
@include head
<title>{{ SITE_NAME }}</title>
</head>
<body>
<main class="container">
	<header>
	<h1><i class="fa fa-hand-spock-o fa-flip-horizontal"></i> {{ SITE_NAME }}</h1>
	{{ SITE_DESC }}
	</header>

	<section class="row">
		<section class="col-md-6">
@each posts
			<article>
				<h2><a href="{{ id }}.html">{{ title }}</a></h2>
				<p class="post-date">Published on <time>{{ date }}</time></p>
				<p>{{ summary }}</p>
			</article>
@end
		</section>
	</section>

	<footer id="author" class="row">
		<section class="col-md-5">
			<span class="text-center">Page générée par une version <a href="http://github.com/Flyounet/baker">modifiée</a> de <a href="http://github.com/taylorchu/baker">baker</a>.</span>
@if RSS_DATE
			<span class="text-center"><i class="fa-li fa fa-rss"></i><a href="rss.xml">RSS</a></span>
@end
@if ATOM_DATE
			<span class="text-center"><i class="fa-li fa fa-rss"></i><a href="atom.xml">Atom</a></span>
@end
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
