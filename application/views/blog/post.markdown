## <?php echo markdown::anchor('post/'.$post->slug, $post->title) ?>

#### Posted on <?php echo date('m/d/y', strtotime($post->created)) ?>

<?php echo $post->content ?>
