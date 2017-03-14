---
---
<?xml version='1.0' encoding='utf-8' ?>
<feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom">
 <title type="html"><![CDATA[ {{ SITE_NAME }} ]]></title>
 <subtitle type="html"><![CDATA[ {{ SITE_DESC }} ]]></subtitle>
 <link href="{{ RSS_SITE_URL }}/atom.xml" rel="self"/>
 <updated>{{ ATOM_DATE }}</updated>
 <author>
  <name>{{ AUTHOR_NAME }}</name>
 </author>
 <id>tag:{{ ATOM_TAG }}:{{ RSS_SITE_URL }}/atom.xml</id>
@each posts
 <entry>
  <title type="html"><![CDATA[ {{ title }} ]]></title>
  <link type='text/html' href='{{ RSS_SITE_URL }}/{{ id }}.html'/>
  <id>tag:{{ atomtag }}:{{ RSS_SITE_URL }}/{{ id }}.html</id>
  <updated>{{ atomdate }}</updated>
  <author>
   <name>{{ AUTHOR_NAME }}</name>
  </author>
  <summary type="html"><![CDATA[ {{ summary }} ]]></summary>
 </entry>
@end
</feed>
