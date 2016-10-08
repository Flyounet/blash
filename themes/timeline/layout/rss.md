---
---
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
	<channel>
		<generator>Baker: static blog generator in bash</generator>
		<docs>http://blogs.law.harvard.edu/tech/rss</docs>
		<title><![CDATA[ {{ SITE_NAME }} ]]></title>
		<link>{{ RSS_SITE_URL }}</link>
		<description><![CDATA[ {{ SITE_DESC }} ]]></description>
		<pubDate>{{ RSS_DATE }}</pubDate>
@each posts
		<item>
			<title><![CDATA[ {{ title }} ]]></title>
			<link>{{ RSS_SITE_URL }}/{{ id }}.html</link>
			<guid>{{ RSS_SITE_URL }}/{{ id }}.html</guid>
			<description><![CDATA[ {{ summary }} ]]></description>
			<pubDate>{{ rssdate }}</pubDate>
		</item>
@end
	</channel>
</rss>
