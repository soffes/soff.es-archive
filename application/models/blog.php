<?php defined('SYSPATH') OR die('No direct access allowed.');

class Blog_Model extends Model {

	public function get_posts()
	{
		$result = $this->db->select('id, title, content, slug, created')->from('posts')->orderby('created', 'desc')->get();
		return $result->result_array();
	}
}
