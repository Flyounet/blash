---
---
	<footer id="author">
		<section>
			<img class="paperclip" src="theme/paperclip.png" alt="paperclip" />
			<nav><h3>Qui m'a fait ça ?</h3>
				<ul class="fa-ul">
					<li class="author-generator"><i class="fa-li fa fa-terminal fa-lg"></i>Ce site est généré dans mon terminal par <a href="http://github.com/Flyounet/blash" title="Utilisé ici même">Blash</a>.</li>
					<li class="author-copiage"><i class="fa-li fa fa-eye fa-lg"></i>Ce site a honteuseument plagié le design de <a href="http://goldy.furry.com" title="Dans la tête de Goldy">Goldy</a>.</li>
				</ul>
				<ul class="fa-ul">
@if RSS_DATE
					<li class="author-rss"><i class="fa-li fa fa-rss"></i><a href="rss.xml"><span>RSS</span></a></li>
@end
@if ATOM_DATE
					<li class="author-atom"><i class="fa-li fa fa-rss"></i><a href="atom.xml"><span>Atom</span></a></li>
@end
@if INDEX_GENERATION_DATE
					<li class="author-atom"><i class="fa-li fa fa-clock-o"></i>Page générée le <time>{{ INDEX_GENERATION_DATE }}</time></a></li>
@end
				</ul>
			</nav>
		</section>
		<section>
			<img class="paperclip" src="theme/paperclip.png" alt="paperclip" />
			<nav>
				<h3>Colophon</h3>
				<ul class="fa-ul">
					<li class="author-name"><i class="fa-li fa fa-user"></i>{{ AUTHOR_NAME }}</li>
					<li class="author-desc"><i class="fa-li fa fa-smile-o"></i>{{ AUTHOR_DESC }}</li>
				</ul>
				<ul class="fa-ul">
					<li class="author-contact"><i class="fa-li fa fa-envelope"></i>{{ AUTHOR_EMAIL }}</li>
					<li class="author-contact"><i class="fa-li fa fa-github"></i><a href="https://github.com/Flyounet/blash">{{ AUTHOR_GITHUB }}</a></li>
				</ul>
			</nav>
		</section>
	</footer>
