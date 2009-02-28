<p><?php echo html::anchor(FALSE, '&#171; all posts') ?></p>

<div class="post">
	<h1><?php echo html::anchor('post/'.$post->slug, $post->title) ?></h1>
	<p class="meta">Posted on <?php echo date('m/d/y', strtotime($post->created)) ?>.</p>
	<div class="content">
		<?php echo markdown::to_html($post->content) ?>
	</div>
</div>

<div class="comments">
<?php echo ($comments ? 
		page::view('blog/comments/list', array('comments' => $comments)) : 
		page::view('blog/comments/no_comments')
	),
	page::view('blog/comments/form'); ?>

</div>
