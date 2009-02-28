<div id="header" class="clear">
	<p>Welcome to <?php echo html::anchor(FALSE, 'samsoff.es') ?>. Enjoy my blog.</p>
	<?php echo page::view('_templates/nav') ?>
</div>

<?php foreach ($posts as $post) : ?>

<div class="post">
	<h1><?php echo html::anchor('post/'.$post->slug, $post->title) ?></h1>
	<p class="meta">Posted on <?php echo date('m/d/y', strtotime($post->created)) ?>. <?php echo html::anchor('post/'.$post->slug, $post->comments.' '.inflector::plural('comment', $post->comments)) ?>.</p>
	<div class="content">
		<?php echo markdown::to_html($post->content) ?>
	</div>
</div>

<?php endforeach ?>
