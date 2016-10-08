---
---
<!DOCTYPE html>
<html>
<head>
@include head
<title>{{ SITE_NAME }}</title>
</head>

<main class="container">
	<header>
	<h1>{{ SITE_NAME }}</h1>
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
		<section class="col-md-2">
			<img alt="author-avatar" class="author-avatar pull-right" src="http://www.gravatar.com/avatar/{{ AUTHOR_EMAIL_HASH }}" />
		</section>
		<section class="col-md-4">
@include author

			<img alt="logo-blash" src="image/blash.png" />
		</section>
	</section>

	<footer class="text-center">
		A <a href="http://github.com/flyounet/blash">blash</a> blog.
@if RSS_DATE
		<span class="text-center"><i class="fa-li fa fa-rss"></i><a href="rss.xml">RSS</a></span>
@end
@if ATOM_DATE
		<span class="text-center"><i class="fa-li fa fa-rss"></i><a href="atom.xml">Atom</a></span>
@end
	</footer>
</main>

</html>
