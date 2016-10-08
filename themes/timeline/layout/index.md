---
GENERATEINDEX:true
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

	<section class="timeline">
@each posts
@if NEWDATE
		<h2>{{ newdate }}</h2>
@end
@if NEWSECTION
		<section>
@end
@if indexTimeline
			<article class="{{ indexTimeline }}">
@end
@if !indexTimeline
			<article>
@end
				<h3><a href="{{ id }}.html">{{ title }}</a></h2>
				<p>{{ summary }}</p>
				<time>{{ date }}</time>
			</article>
@if NEWENDSECTION
		</section>
@end
@end
	</section>

	<footer id="author" class="flexouille">
		<section>
			<span class="text-center">Page générée par une version <a href="http://github.com/Flyounet/baker">modifiée</a> de <a href="http://github.com/taylorchu/baker">baker</a>.</span>
@if RSS_DATE
			<span class="text-center"><i class="fa-li fa fa-rss"></i><a href="rss.xml">RSS</a></span>
@end
@if ATOM_DATE
			<span class="text-center"><i class="fa-li fa fa-rss"></i><a href="atom.xml">Atom</a></span>
@end
		</section>
		<section>
@include author
@include contact
		</section>
	</footer>
</main>
</body>
</html>
