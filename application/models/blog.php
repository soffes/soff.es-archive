<?php defined('SYSPATH') OR die('No direct access allowed.');

class Blog_Model extends Model {

	public function get_posts()
	{
		$sql = 'SELECT p.id, p.title, p.content, p.slug, p.created, COUNT(c.post_id) as comments FROM posts p LEFT JOIN comments c ON c.post_id = p.id GROUP BY p.id ORDER BY p.created DESC;';
		$result = $this->db->query($sql);
		return $result->result_array();
	}
	
	public function get_post_by_slug($slug)
	{
		$result = $this->db->query("SELECT id, title, content, slug, created FROM posts WHERE slug = '$slug';");
		if (count($result) != 1)
		{
			return FALSE;
		}
		
		$array = $result->result_array();
		return $array[0];
	}
	
	public function get_comments_by_post_id($id)
	{
		$result = $this->db->query("SELECT name, website, content FROM comments WHERE post_id = '$id' ORDER BY created ASC;");
		if (count($result) != 1)
		{
			return FALSE;
		}
		
		return $result->result_array();
	}
}
