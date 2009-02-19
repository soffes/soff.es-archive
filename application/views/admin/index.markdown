# Admin

Welcome to the wonderful admin :)

## Posts

**<?php echo markdown::anchor('admin/new', 'Add a new post') ?>**

Choose a post to edit

<?php foreach ($posts as $post) : ?>
* <?php echo markdown::anchor('admin/edit/'.$post->id, $post->title) ?>

<?php endforeach ?>
