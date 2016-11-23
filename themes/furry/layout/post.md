---
---
<!DOCTYPE html>
<html>
<head>
@include head_index
<title>{{ SITE_NAME }}</title>
</head>
<body>
<main>
	<header>
		<h1><i class="fa fa-hand-spock-o fa-flip-horizontal"></i> {{ SITE_NAME }}</h1>
		<p>{{ SITE_DESC }}</p>
	</header>
	<nav>
		<ul>
			<li><a href="#author" title="About"><i class="fa fa-heartbeat fa-2x"></i></a></li>
                        <li><a href="{{ POST_NEXT }}" title="Newer"><i class="fa fa-long-arrow-right fa-2x"></i></a></li>
                        <li><a href="{{ POST_PREV }}" title="Older"><i class="fa fa-long-arrow-left fa-2x"></i></a></li>
			<li><a href="index.html" title="Home"><i class="fa fa-home fa-2x"></i></a></li>
	</nav>

	<div id="content">
		<section>
			<article>
				<h1>{{ title }}</h1>
				<mark>Rédigé le <time>{{ date }}</time>.
@if update
				Édité le <time>{{ update }}</time>.
@end
				</mark>
@if PRINTSUMMARY
				{{ SUMMARYPARSED }}
@end
				{{ content }}
			</article>
		</section>
		<aside>
			<div class="boxp">
				<img class="paperclip" src="theme/paperclip.png" alt="paperclip" />
				<nav>
					<h3>Tags</h3>
					<ul>
@each tags_for_post
						<li><a href="{{ link }}">{{ name }}</a></li>
@end
					</ul>
				</nav>
			</div>
		</aside>
	</div>
@include footer
</main>
</body>
</html>
