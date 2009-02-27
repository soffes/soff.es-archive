Comments
--------

<?php foreach($comments as $comment) : ?>
#### <?php echo ($comment->website ? markdown::anchor($comment->website, $comment->name) : $comment->name) ?>

<?php echo $comment->content ?>

<?php endforeach ?>
