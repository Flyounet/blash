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
@if GENERATE_INDEX
			<li class="active"><a href="index.html" title="Home"><i class="fa fa-home fa-2x"></i></a></li>
@end
@if !GENERATE_INDEX
			<li><a href="index.html" title="Home"><i class="fa fa-home fa-2x"></i></a></li>
@end
	</nav>
	<div id="content">
		<section>
@each posts
@if NEWDATE
			<h2>{{ newdate }}</h2>
@end
@if NEWSECTION
			<section>
@end
			<article>
				<h3><a href="{{ id }}.html">{{ title }}</a></h3>
				<mark>Rédigé le <time>{{ date }}</time>.
@if update
				Édité le <time>{{ update }}</time>.
@end
				</mark>
				{{ summary }}
			</article>

@if NEWENDSECTION
			</section>
@end
@end
		</section>
		<aside>
			<div class="boxp">
				<img class="paperclip" src="theme/paperclip.png" alt="paperclip" />
				<nav>
					<h3>Tags</h3>
					<ul>
@each tags_for_index
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
