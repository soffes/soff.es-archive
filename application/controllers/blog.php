<?php defined('SYSPATH') OR die('No direct access allowed.');

class Blog_Controller extends Page_Controller {

	public function __construct()
	{
		parent::__construct();
		
		// Initialize the model
		$this->model = new Blog_Model;
	}

	public function index($page = 1)
	{
		// Display the page
		$this->page->display('blog/posts', $this->model->get_posts($page));
	}
	
	public function post($slug = NULL)
	{
		// Make sure their is a slug
		if ($slug == NULL)
		{
			url::redirect();
		}
		
		$post = $this->model->get_post_by_slug($slug);
		
		// Make sure their was a post
		if (!$post)
		{
			$this->page->addTitle('Post Not Found');
			$this->page->display('blog/post_not_found', FALSE, 'markdown');
		}
		
		$data = array
		(
			'post' => $post,
			'comments' => $this->model->get_comments_by_post_id($post->id)
		);
		
		$this->page->addTitle($post->title);
//		$this->page->addJS('http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js');
//		$this->page->addJS('comments');
		$this->page->display('blog/post', $data);
	}
	
	public function rss()
	{
		// Display the feed
		header('Content-type: text/xml');
		echo page::view('blog/rss', $this->model->get_posts(1, 20));
	}
}
