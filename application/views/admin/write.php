<div id="header" class="clear">
	<p><?php echo html::anchor('admin', '&#171; Blog Admin') ?></p>
	<?php echo page::view('_templates/nav') ?>
</div>

<h1>Write Post</h1>

<form action="<?php echo url::site('admin/save') ?>" method="post">
	<p><input type="text" class="text" name="title" style="width:24em" /></p>
	<p><textarea name="content"></textarea></p>
	<p style="font-size:0.8em">Markdown enabled. <a href="http://daringfireball.net/projects/markdown/basics" target="_blank">Learn how to write Markdown.</a></p>
	<p><input type="submit" class="submit" value="Write Post" /></p>
</form>
