<h2>Comments</h2>
<ul>
<?php foreach($comments as $comment) : ?>
	<li id="comment-<?php echo $comment->id ?>">
		<h3><?php echo ($comment->website ? html::anchor($comment->website, $comment->name) : $comment->name) ?> <small><?php echo date('m/d/y', strtotime($comment->created)) ?></small></h3>
		<?php echo markdown::to_html($comment->content) ?>
	</li>

<?php endforeach ?>
</ul>