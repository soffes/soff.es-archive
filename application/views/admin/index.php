<div id="header" class="clear">
	<p><?php echo html::anchor(FALSE, '&#171; blog home') ?></p>
	<?php echo page::view('_templates/nav') ?>
</div>

<h1>Admin</h1>

<p>Welcome to the wonderful admin :)</p>

<h2>Posts</h2>

<p><strong><?php echo html::anchor('admin/write', 'Write a new post') ?></strong></p>

<p>Choose a post to edit</p>

<ul>
<?php foreach ($posts['posts'] as $post) : ?>
<li><?php echo html::anchor('admin/edit/'.$post->id, $post->title) ?></li>

<?php endforeach ?>
</ul>
