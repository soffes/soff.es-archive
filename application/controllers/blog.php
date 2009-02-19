<?php defined('SYSPATH') OR die('No direct access allowed.');

class Blog_Controller extends Page_Controller {

	public function __construct()
	{
		parent::__construct();
		
		// Initialize the model
		$this->model = new Blog_Model;
	}

	public function index()
	{
		$data = array
		(
			'posts' => $this->model->get_posts()
		);
		
		// Display the page
		$this->page->display('blog/posts', $data, 'markdown');
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
			'post' => $post
		);
		
		$this->page->addTitle($post->title);
		$this->page->display('blog/post', $data, 'markdown');
	}
}
