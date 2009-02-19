<?php defined('SYSPATH') OR die('No direct access allowed.');

class Blog_Model extends Model {

	public function get_posts()
	{
		$post1->title = 'This is awesome';
		$post1->content = 'I love markdown. Reasons:
* It\'s awesome
* It\s super easy to use';
		return array($post1);
	}
}
