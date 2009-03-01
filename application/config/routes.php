<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * @package  Core
 *
 * Sets the default route to "blog"
 */
$config['_default'] = 'blog';
$config['post/([a-zA-Z0-9\-]+)'] = 'blog/post/$1';
$config['post/([a-zA-Z0-9\-]+)/post_comment'] = 'blog/post_comment/$1';
$config['rss'] = 'blog/rss';
