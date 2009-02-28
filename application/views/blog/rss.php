<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
	<channel>
		<description>samsoffes.com is my place to muse, show off my work, and give you a little something to brighten your day. You'll find stuff about Cocoa, PHP, MySQL, XHTML, CSS, Javascript, AJAX, Quartz Composer, music, Linux experiments, and other random stuff. Enjoy.</description>
		<title>samsoff.es</title>
		<generator>samsoff.es</generator>
		<link><?php echo url::site() ?></link>
		
<?php foreach($posts as $post) :  $url = url::site('post/'.$post->slug); ?>
		<item>
			<title><?php echo $post->title ?></title>
			<description><?php echo htmlentities(markdown::to_html($post->content), ENT_QUOTES, 'UTF-8') ?></description>
			<link><?php echo $url ?></link>
			<guid><?php echo $url ?></guid>
			<pubDate><?php echo date('r', strtotime($post->created)) ?></pubDate>
		</item>
		
<?php endforeach ?>
	</channel>
</rss>
