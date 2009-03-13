<h2>Add A Comment</h2>

<form id="comment-form" action="<?php echo url::site(Router::$current_uri.'/post_comment') ?>" method="post">
	<dl>
		<dt><label for="comment-name">Your Name</label></dt>
		<dd><input id="comment-name" name="name" type="text" class="text" /></dd>
		<dt><label for="comment-email">Your Email</label></dt>
		<dd><input id="comment-email" name="email" type="text" class="text" /></dd>
		<dt><label for="comment-website">Your Website <small>optional</small></label></dt>
		<dd><input id="comment-website" name="website" type="text" class="text" /></dd>
	</dl>
	<p><textarea id="comment-content" name="content"></textarea></p>
	<p style="font-size:0.8em">Markdown enabled. <a href="http://daringfireball.net/projects/markdown/basics" target="_blank">Learn how to write Markdown.</a></p>
	<p><input type="submit" class="submit" value="Post Your Comment" /></p>
</form>
