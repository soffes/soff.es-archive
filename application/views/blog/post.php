<?php echo html::anchor(FALSE, '&#171; all posts') ?>

<div class="post">
	<h1><?php echo html::anchor('post/'.$post->slug, $post->title) ?></h1>
	<div class="meta">Posted on <?php echo date('m/d/y', strtotime($post->created)) ?>.</div>
	<div class="content">
		<?php echo markdown::to_html($post->content) ?>
	</div>
</div>

<?php /* echo ($comments ? 
		page::view('blog/comments/list', array('comments' => $comments), 'markdown') : 
		page::view('blog/comments/no_comments', FALSE, 'markdown')
	),
	page::view('blog/comments/form'); */
